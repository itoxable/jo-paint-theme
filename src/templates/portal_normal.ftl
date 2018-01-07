<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Quicksand:400,500,700" rel="stylesheet">

	<@liferay_util["include"] page=top_head_include />

</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-12 top-wrapper">
			
			<header id="banner" role="banner" class="space-between align-middle full-w layout-column layout-row-xs align-center-xs">
				<div id="mobile-nav-button">
					<div id="mobile-nav-icon">
						<span></span>
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				<div id="heading">
					<div class="site-title">
						<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
							<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
						</a>

						<#if show_site_name>
							<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
								${site_name}
							</span>
						</#if>
					</div>
				</div>

				<#--  <#if !is_signed_in>
					<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
				</#if>  -->
				
				<div class="navigation">
					<#if has_navigation && is_setup_complete>
						<#include "${full_templates_path}/navigation.ftl" />
					</#if>
					<div class="close-navigation">
						<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
					<div>
				</div>
				
				
			</header>
		</div>
	</div>

	

	<div class="container">
		<div class="row">

			<section id="content">
				<h1 class="hide-accessible">${the_title}</h1>

				<#if selectable>
					<@liferay_util["include"] page=content_include />
				<#else>
					${portletDisplay.recycle()}

					${portletDisplay.setTitle(the_title)}

					<@liferay_theme["wrap-portlet"] page="portlet.ftl">
						<@liferay_util["include"] page=content_include />
					</@>
				</#if>
			</section>

		</div>
	</div>

	

	<footer id="footer" role="contentinfo">
		<div class="social nav-social">
			<ul>
				<li>
					<a href="http://www.facebook.com/ericajanephotographer" target="_blank">
						<i class="fa fa-facebook" aria-hidden="true"></i>
					</a>
				</li>
				<li>
					<a href="https://www.instagram.com/ericajanephotographer/" target="_blank">
						<i class="fa fa-instagram" aria-hidden="true"></i>
					</a>
				</li>
				<li>
					<a href="http://www.pinterest.com/iamericajane" target="_blank">
						<i class="fa fa-pinterest" aria-hidden="true"></i>
					</a>
				</li>
			</ul>
		</div>
	</footer>
</div>
<div id="overlay"></div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->

	<script type="text/javascript" src="${javascript_folder}/slick.js"></script>
	<script type="text/javascript">
		function closeNavigation() {
			$('body').toggleClass("menu-on");
		}
		$('#mobile-nav-button').click(function(){
			closeNavigation();
		});
		$('#overlay').click(function(){
			closeNavigation();
		});
		$('.close-navigation').click(function(){
			closeNavigation();
		});

		
	</script>


<!-- endinject -->



</body>

</html>