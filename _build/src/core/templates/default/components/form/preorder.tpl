{$key = rand()}

<form id="preorder" class="form row" data-validate="preorder" autocomplete="off" name="preorder">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Шаг 1. Оформление заказа.">
    <input type="hidden" name="page" value="{field name=pagetitle}">
    <div class="input-field col s24 l8">
        <input type="text" id="username-{$key}" name="username">
        <label for="username-{$key}">Ваше имя</label>
    </div>

    <div class="input-field col s24 l8">
        <input type="email" id="email-{$key}" name="email">
        <label for="email-{$key}">Электронная почта<sup>*</sup></label>
    </div>

    <div class="input-field col s24 l8">
        <input type="tel" id="phone-{$key}" name="phone">
        <label for="phone-{$key}">Телефон</label>
    </div>

    <div class="col s24">
        {include file="components/form/_agree.tpl" btn="Далее"}
    </div>

    <div class="center-align col s24">
        <button type="submit" class="btn">Далее</button>
    </div>

</form>