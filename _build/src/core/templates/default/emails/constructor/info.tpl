<table style="border-collapse:collapse;width:100%;border-top:1px solid #dddddd;border-left:1px solid #dddddd;margin-bottom:20px">
    <thead>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222">Дополнительная информация</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:left;padding:7px">
            {($properties.page) ? "<b>Заказ оформлен на странице:</b> {$properties.page}<br>": ""}
            <b>Дата и время оформления заказа:</b> {$smarty.now|date_format:"%d-%m-%Y %k:%M"}<br>
            <b>IP адрес компьютера:</b> {$smarty.server.REMOTE_ADDR}
        </td>
    </tr>
    </tbody>
</table>