{$key = rand()}

<form name="callback" class="form" data-validate="callback">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Заказ обратного звонка.">
    <div class="input-field">
        <input type="text" id="username-{$key}" name="username">
        <label for="username-{$key}">Ваше имя</label>
    </div>

    <div class="input-field">
        <input type="tel" id="phone-{$key}" name="phone">
        <label for="phone-{$key}">Телефон</label>
    </div>

    {include file="components/form/_agree.tpl"}

    <div class="center-align">
        <button type="submit" class="btn">Отправить</button>
    </div>

</form>