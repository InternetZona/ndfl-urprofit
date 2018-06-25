{extends file="emails/mgr/preorder.tpl"}

{block name=content prepend}
    {include file="emails/constructor/title.tpl" text="Детализация заказа"}
    {include file="emails/constructor/list.order.tpl" data=$properties}
{/block}