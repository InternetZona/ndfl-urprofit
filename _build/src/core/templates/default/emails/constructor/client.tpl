<table style="border-collapse:collapse;width:100%;border-top:1px solid #dddddd;border-left:1px solid #dddddd;margin-bottom:20px">
    <thead>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222">Контакты</td>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222">Комментарий</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:left;padding:7px">
            {($properties.username) ? "<b>Имя:</b> {$properties.username}<br>" : ""}
            {($properties.email) ? "<b>E-mail:</b> {$properties.email}<br>" : ""}
            {($properties.phone) ? "<b>Телефон:</b> {$properties.phone}<br>" : ""}
        </td>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:left;padding:7px">
            {($properties.comment) ? "{$properties.comment|default:"-"}" : ""}
        </td>
    </tr>
    </tbody>
</table>