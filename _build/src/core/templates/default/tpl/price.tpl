{extends file="basepage.tpl"}

{block name=content prepend}

    <table class="table highlight">
        <thead>
        <tr>
            <th>Тип услуги</th>
            <th class="center-align">Цена</th>
        </tr>
        </thead>
        <tbody>

        {$priceList = {tv name=priceList}|json_decode:true}

        {foreach $priceList as $data}

            <tr>
                <td>
                    {if $data.service_id}
                        <a href="{$modx->makeUrl($data.service_id)}">{$data.title}</a>

                    {else}
                        {$data.title}

                    {/if}
                </td>
                <td class="center-align">

                    {$cost = 'бесплатно'}

                    {if $data.service_id}

                        {if $object = $modx->getObject('modResource', $data.service_id)}

                            {if $price = $object->getTVValue('price')}

                                {if $object->getTVValue('isfrom')}
                                    {$cost = "от {$price|number_format:0:',':' '} руб"}
                                {else}
                                    {$cost = "{$price|number_format:0:',':' '} руб"}
                                {/if}

                            {/if}
                        {/if}

                    {elseif $data.price}

                        {if $data.isfrom}
                            {$cost = "от {$data.price|number_format:0:',':' '} руб"}
                        {else}
                            {$cost = "{$data.price|number_format:0:',':' '} руб"}
                        {/if}

                    {/if}

                    {$cost}


                </td>
            </tr>

        {/foreach}

        </tbody>
    </table>

{/block}