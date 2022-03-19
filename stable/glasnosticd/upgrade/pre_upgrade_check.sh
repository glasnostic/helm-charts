#!/bin/bash

check_controller_version() {
    currentver=$(kubectl get deployment -n glasnostic-system --ignore-not-found -o json | jq -r ".spec.template.spec.containers[].image" | cut -f2 -d ':')
    requiredver="v1.0.0"

    if [[ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" || -z "$currentver" ]]; then
        echo "Controller version check: PASSED!"
        return 0
    else
        echo "Controller version check: FAILED -- old Glasnostic installation ($currentver) is still running"
        return 1
    
    fi
}

check_injector() {
    status=0
    for ns in "glasnostic-system"; do

        injector=$(kubectl get daemonset -n ${ns} glasnosticd --ignore-not-found -o json | jq -r .kind)

        if [ -z $injector ]; then
            echo "Injector check for namespace ${ns}: PASSED!"
        else
           echo "Injector check: FAILED -- Glasnostic is still running in namespace ${ns}"
           return 1
        fi

    done
    return 0
}

main() {

    exitcode=0

    check_controller_version || exitcode=1
    check_injector || exitcode=1

    if [ ${exitcode} = 0 ]; then
        echo -e "\nYour cluster is ready for upgrade. Please proceed to the installation instructions"
    else
        echo -e "\nYour cluster is NOT ready for upgrade. Please uninstall all the identified items before proceeding"
    fi
}

main
