<nav class="${nav_css_class}" id="navigation" role="navigation">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

	<ul class="nav navbar-nav navbar-right" aria-label="<@liferay.language key="site-pages" />" role="menubar">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_attr_selected = ""
				nav_item_css_class = ""
				nav_item_layout = nav_item.getLayout()
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_attr_selected = "aria-selected='true'"
					nav_item_css_class = "selected"
				/>
			</#if>

			<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>

				<#if nav_item.hasChildren()>
					<ul class="child-menu" role="menu">
						<#list nav_item.getChildren() as nav_child>
							<#assign
								nav_child_attr_selected = ""
								nav_child_css_class = ""
							/>

							<#if nav_item.isSelected()>
								<#assign
									nav_child_attr_selected = "aria-selected='true'"
									nav_child_css_class = "selected"
								/>
							</#if>

							<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
								<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
							</li>
						</#list>
					</ul>
				</#if>
			</li>
		</#list>
	</ul>
</nav>

<div class="social nav-social">
	<ul>
		<li>
			<a href="http://www.facebook.com/ericajanephotographer" target="_blank">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 30 24" height="24px" xml:space="preserve" class="icon icon-facebook"><path d="M16.21 20h-3.26v-8h-1.63V9.24h1.63V7.59c0-2.25 0.92-3.59 3.53-3.59h2.17v2.76H17.3 c-1.02 0-1.08 0.39-1.08 1.11l0 1.38h2.46L18.38 12h-2.17V20z"></path></svg>
			</a>
		</li>
		<li>
			<a href="https://www.instagram.com/ericajanephotographer/" target="_blank">
			<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 24" style="enable-background:new 0 0 30 24;" xml:space="preserve" class="icon icon-instagram">
			<g>
				<path d="M15,5.4c2.1,0,2.4,0,3.2,0c0.8,0,1.2,0.2,1.5,0.3c0.4,0.1,0.6,0.3,0.9,0.6c0.3,0.3,0.5,0.5,0.6,0.9
				c0.1,0.3,0.2,0.7,0.3,1.5c0,0.8,0,1.1,0,3.2s0,2.4,0,3.2c0,0.8-0.2,1.2-0.3,1.5c-0.1,0.4-0.3,0.6-0.6,0.9c-0.3,0.3-0.5,0.5-0.9,0.6
				c-0.3,0.1-0.7,0.2-1.5,0.3c-0.8,0-1.1,0-3.2,0s-2.4,0-3.2,0c-0.8,0-1.2-0.2-1.5-0.3c-0.4-0.1-0.6-0.3-0.9-0.6
				c-0.3-0.3-0.5-0.5-0.6-0.9c-0.1-0.3-0.2-0.7-0.3-1.5c0-0.8,0-1.1,0-3.2s0-2.4,0-3.2c0-0.8,0.2-1.2,0.3-1.5c0.1-0.4,0.3-0.6,0.6-0.9
				c0.3-0.3,0.5-0.5,0.9-0.6c0.3-0.1,0.7-0.2,1.5-0.3C12.6,5.4,12.9,5.4,15,5.4 M15,4c-2.2,0-2.4,0-3.3,0c-0.9,0-1.4,0.2-1.9,0.4
				c-0.5,0.2-1,0.5-1.4,0.9C7.9,5.8,7.6,6.2,7.4,6.8C7.2,7.3,7.1,7.9,7,8.7C7,9.6,7,9.8,7,12s0,2.4,0,3.3c0,0.9,0.2,1.4,0.4,1.9
				c0.2,0.5,0.5,1,0.9,1.4c0.4,0.4,0.9,0.7,1.4,0.9c0.5,0.2,1.1,0.3,1.9,0.4c0.9,0,1.1,0,3.3,0s2.4,0,3.3,0c0.9,0,1.4-0.2,1.9-0.4
				c0.5-0.2,1-0.5,1.4-0.9c0.4-0.4,0.7-0.9,0.9-1.4c0.2-0.5,0.3-1.1,0.4-1.9c0-0.9,0-1.1,0-3.3s0-2.4,0-3.3c0-0.9-0.2-1.4-0.4-1.9
				c-0.2-0.5-0.5-1-0.9-1.4c-0.4-0.4-0.9-0.7-1.4-0.9c-0.5-0.2-1.1-0.3-1.9-0.4C17.4,4,17.2,4,15,4L15,4L15,4z"></path>
				<path d="M15,7.9c-2.3,0-4.1,1.8-4.1,4.1s1.8,4.1,4.1,4.1s4.1-1.8,4.1-4.1S17.3,7.9,15,7.9L15,7.9z M15,14.7c-1.5,0-2.7-1.2-2.7-2.7
				c0-1.5,1.2-2.7,2.7-2.7s2.7,1.2,2.7,2.7C17.7,13.5,16.5,14.7,15,14.7L15,14.7z"></path>
				<path d="M20.2,7.7c0,0.5-0.4,1-1,1s-1-0.4-1-1s0.4-1,1-1S20.2,7.2,20.2,7.7L20.2,7.7z"></path>
			</g>
			</svg>
			</a>
		</li>
		<li>
			<a href="http://www.pinterest.com/iamericajane" target="_blank">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 30 24" height="24px" xml:space="preserve" class="icon icon-pinterest"><path d="M15.36 4C11.13 4 9 7.1 9 9.74c0 1.6 0.6 3 1.8 3.51c0.2 0.1 0.4 0 0.45-0.23 c0.04-0.16 0.14-0.57 0.18-0.74c0.06-0.23 0.04-0.31-0.13-0.51c-0.36-0.44-0.59-1-0.59-1.8c0-2.32 1.68-4.4 4.38-4.4 c2.39 0 3.7 1.5 3.7 3.52c0 2.65-1.14 4.89-2.82 4.89c-0.93 0-1.63-0.8-1.4-1.77c0.27-1.16 0.79-2.42 0.79-3.26 c0-0.75-0.39-1.38-1.2-1.38c-0.95 0-1.72 1.02-1.72 2.38c0 0.9 0.3 1.4 0.3 1.45s-0.97 4.26-1.14 5 c-0.34 1.49-0.05 3.31-0.03 3.49c0.01 0.1 0.1 0.1 0.2 0.05c0.09-0.12 1.22-1.56 1.61-3.01c0.11-0.41 0.63-2.53 0.63-2.53 c0.31 0.6 1.2 1.1 2.2 1.15c2.86 0 4.8-2.69 4.8-6.3C21 6.5 18.8 4 15.4 4z"></path></svg>
			</a>
		</li>
		<li>
			<a href="https://www.flickr.com/photos/ericajanephoto/" target="_blank">
			<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px" height="24px" viewBox="0 0 30 24" style="enable-background:new 0 0 30 24;" xml:space="preserve" class="icon icon-flickr"><circle cx="9" cy="12" r="5"></circle><circle cx="21" cy="12" r="5"></circle></svg>
			</a>
		</li>
	</ul>
</div>