{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="container">
	<form method="post" action={"/user/login/"|ezurl}>

		<h1>{"Login"|i18n("design/standard/user")}</h1>

        {if $User:warning.bad_login}
			<div class="warning">
				<h2>{"Could not login"|i18n("design/standard/user")}</h2>
				<ul>
					<li>{"A valid username and password is required to login."|i18n("design/standard/user")}</li>
				</ul>
			</div>
        {else}

            {if $site_access.allowed|not}
				<div class="warning">
					<h2>{"Access not allowed"|i18n("design/standard/user")}</h2>
					<ul>
						<li>{"You are not allowed to access %1."|i18n("design/standard/user",,array($site_access.name))}</li>
					</ul>
				</div>
            {/if}
        {/if}

		<div class="mb-3 row">
			<label for="staticEmail" class="col-sm-2 col-form-label">{"Username"|i18n("design/standard/user",'User name')}</label>
			<div class="col-sm-10">
				<input type="text" name="Login" class="form-control" id="staticEmail" value="{$User:login|wash}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="inputPassword" class="col-sm-2 col-form-label">{"Password"|i18n("design/standard/user")}</label>
			<div class="col-sm-10">
				<input type="password" name="Password" class="form-control" id="inputPassword">
			</div>
		</div>

        {if and( ezini_hasvariable( 'Session', 'RememberMeTimeout' ), ezini( 'Session', 'RememberMeTimeout' ) )}
			<div class="block">
				<input type="checkbox" tabindex="1" name="Cookie" id="id3" /><label for="id3" style="display:inline;">{"Remember me"|i18n("design/admin/user/login")}</label>
			</div>
        {/if}

		<div class="buttonblock">
			<input class="btn btn-primary" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/user','Button')}" tabindex="1" />
			<input class="btn" type="submit" name="RegisterButton" value="{'Sign Up'|i18n('design/standard/user','Button')}" tabindex="1" />
		</div>

        {if ezini( 'SiteSettings', 'LoginPage' )|eq( 'custom' )}
			<p><a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/standard/user' )}</a></p>
        {/if}

		<input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />

        {section show=and( is_set( $User:post_data ), is_array( $User:post_data ) )}
            {section name=postData loop=$User:post_data }
				<input name="Last_{$postData:key|wash}" value="{$postData:item|wash}" type="hidden" /><br/>
            {/section}
        {/section}
	</form>
</div>
