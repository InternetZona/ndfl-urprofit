{extends file="emails/web/base.tpl"}

{block name=content}

    <div style="margin-top: 20px; font-size:18px;font-weight:bold;">Спасибо за заказ!</div>
    <p style="margin-top: 0; margin-bottom: 20px;">В ближайшее время с вами свяжется наш менеджер.</p>

    {include file="emails/constructor/title.tpl" text="Детализация заказа"}
    {include file="emails/constructor/list.order.tpl" data=$properties}

{/block}