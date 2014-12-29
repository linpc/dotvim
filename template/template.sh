#!/bin/sh

opt_handle()
{
    while getopts h op
    do
        case ${op} in
            *|h)
                exit 0
                ;;
            esac
    done
}

main()
{
    opt_handle $@
    shift $((${OPTIND} - 1))

    exit 0
}

main $@
