<?php

namespace Encore\Admin\Latlong\Map;

class Supermap extends AbstractMap
{
    public function getAssets()
    {
        return [];
    }
    public function applyScript(array $id)
    {
        $host           = 'https://iserver.supermap.io';
        $url            = $host.'/iserver/services/map-china400/rest/maps/China_4326';
        $addressUrl     = $host.'/iserver/services/addressmatch-Address/restjsr/v1/address';
        return <<<EOT
EOT;
    }
}
