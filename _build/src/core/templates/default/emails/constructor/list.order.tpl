{$total = 0}
<table style="border-collapse:collapse;width:100%;border-top:1px solid #dddddd;border-left:1px solid #dddddd;margin-bottom:20px">
    <thead>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222" colspan="2">Услуга</td>
    </tr>
    </thead>
    <tbody>
        {foreach $data.type as $value}

            <tr>
                <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:left;padding:7px" colspan="2">{$value}</td>
            </tr>

        {/foreach}
    </tbody>
    <tfoot>

    {if $properties.wait}

        {else}

        {if $properties.waitManager}

            <tr>
                <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px; color: red;" colspan="2"><b>Стоимость требует согласования с менеджером.</b></td>
            </tr>

        {else}

            <tr>
                <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px"><b>Итого:</b></td>
                <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px"><b>{$properties.full|number_format:0:',':' '|cat:' руб.'}</b></td>
            </tr>

            <tr>
                <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px"><b>По скидке:</b></td>
                <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px"><b>{$properties.discount|number_format:0:',':' '|cat:' руб.'}</b></td>
            </tr>

        {/if}

    {/if}

    {if $properties.delivery}
        <tr>
            <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px" colspan="2">
                <b>Способ доставки:</b> {$properties.delivery}
            </td>
        </tr>
    {/if}
    </tfoot>
</table>