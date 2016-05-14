#!/bin/bash
set -e

# Default values
: ${ZEO_HOST:="zeo"}
: ${ZEO_PORT:="8100"}

set_config_section() {
    output="$1"
    section="$2"
    key="$3"
    value="$4"
    sed -i -re '/<'"${section}"'>/ ,/<\/'"${section}"'>/ s!('"${key}"'\s+)[^=]*$!\1'"${value}"'!'  ${output}
}


echo "SET CONFIG"
set_config_section /plone/parts/instance/etc/zope.conf zeoclient server $ZEO_HOST:$ZEO_PORT
set_config_section /plone/parts/zeo/etc/zeo.conf zeo address $ZEO_PORT

echo "START"
exec "$@"
