<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />

<div class="container-fluid portlet-content-wrapper" style="padding: 0;">
	<div class="inline-full-content-two-columns row-fluid">	
						
		<#list entries as entry>
			<#assign entry = entry />
		
			<#assign assetRenderer = entry.getAssetRenderer() />
			<#assign article = assetRenderer.getArticle()/>
			
			<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
			<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />
			<#assign entryDate = entry.getPublishDate()?string("dd.MM.yy") />
			<#assign imageUrl = assetRenderer.getURLImagePreview(renderRequest) />
			<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />


			<#assign article = assetRenderer.getArticle()/>

            <#assign doc = saxReaderUtil.read(article.getContentByLocale(locale)) />
			<#assign section = doc.selectSingleNode("/root/dynamic-element[@name='section']/dynamic-content").getText() />
			<#assign secondSection = doc.selectSingleNode("/root/dynamic-element[@name='secondSection']/dynamic-content").getText() />
			
			<#assign text = doc.selectSingleNode("/root/dynamic-element[@name='Text']/dynamic-content").getText() />
			
			<#assign warning = "na" />
			<#if validator.isNull(doc.selectSingleNode("/root/dynamic-element[@name='Has_Warnings']"))>
			    <#assign warning = "na" />
			<#else>
			    <#assign warning = doc.selectSingleNode("/root/dynamic-element[@name='Has_Warnings']/dynamic-content").getText() />
			</#if>
			
			
            <#assign sectionColor = "transparent" />
			<#if "geoplace" == section?lower_case>
			    <#assign sectionColor = "#FFDD00" />
			<#elseif "street" == section?lower_case>
			    <#assign sectionColor = "#e57d37" />
			<#elseif "address" == section?lower_case>
			    <#assign sectionColor = "#85bc4a" />
			</#if>
			
			<#if "na" != secondSection?lower_case>
    		    <#assign secondSectionColor = "transparent" />
    			<#if "geoplace" == secondSection?lower_case>
    			    <#assign secondSectionColor = "#FFDD00" />
    			<#elseif "street" == secondSection?lower_case>
    			    <#assign secondSectionColor = "#e57d37" />
    			<#elseif "address" == secondSection?lower_case>
    			    <#assign secondSectionColor = "#85bc4a" />
    			</#if> 
            </#if>

			<div class="span6 span-md-6" id="${renderResponse.getNamespace()}-${article.getId()}">
			    <div class="lfr-meta-actions asset-actions" style="float: none">
			        <@getEditIcon/>
			    </div>
			    <div class="news-card">
			        <div class="asset-overlay"></div>
			        <#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>
			            <#if "na" != warning>
			                <#if "true" == warning>
			                    <i class="fa fa-exclamation-circle import-warning" title="Links on this content must be validated"></i>
			                </#if>
			            </#if>
			        </#if> 

			        <div class="section-wrapper">
    			        <div class="news-section" style="border-top-color: ${sectionColor}">
    			            <div class="section-name">
        			            <@liferay_ui["message"] key="${section?lower_case}" />
        			        </div>
    			        </div>
    			        <#if "na" != secondSection?lower_case>
        			        <div class="news-section second-section" style="border-top-color: ${secondSectionColor}">
        			            <div class="section-name">
            			            <@liferay_ui["message"] key="${secondSection?lower_case}" />
            			        </div>
        			        </div>
        			    </#if>
    			    </div>
    			    <div class="news-top">
    			        
    			        <p class="news-title">
        			        <a href="${viewURL}">
                                ${entryTitle}
        			        </a>
    			        </p>
    			        <p class="news-text">${assetRenderer.getSummary(locale)}</p>
    			        <p class="news-date">
    			            ${entryDate}
    			        </p>
    			    </div>

    			    <div class="news-image" style="background-image: url(${assetRenderer.getURLImagePreview(renderRequest)});">
    			    
    			    </div>
    			    <div class="news-bottom">
    			        <a class="news-link" href="${viewURL}">
                            ${viewLinkLabel}
    			        </a>
    			    </div>
			    </div>
			</div>
		</#list>
	</div>
</div>

<#macro getEditIcon>
	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>
		<#assign redirectURL = renderResponse.createRenderURL() />
		
		${redirectURL.setParameter("struts_action", "/asset_publisher/add_asset_redirect")}
		${redirectURL.setWindowState("pop_up")}
		
		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState("pop_up"), redirectURL)!"" />
		
		<#if validator.isNotNull(editPortletURL)>
			<#assign title = languageUtil.format(locale, "edit-x", entryTitle) />
		

    			<@liferay_ui["icon"]
    			label=true
    			image="edit"
    			message="Edit"
    			url="javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:'" + renderResponse.getNamespace() + "editAsset', title: '" + title + "', uri:'" + htmlUtil.escapeURL(editPortletURL.toString()) + "'});"
    			/>
		</#if>
		<span>
		   
    		<span class="asset-expire-button-${article.getId()}" style="display: none; margin: 0 10px">
    			<@liferay_ui["icon"]
        			label=true
        			image="expire"
        			message="Expire"
        			url="javascript:$('#full-overlay').fadeIn(50,function(){$('.asset-expire-confirm-dialog-"+article.getId()+"').fadeIn(200)})"
        			/>

        		<i onclick="$('.asset-expire-button-${article.getId()}').fadeOut(200,function(){$('.show-asset-expire-button-${article.getId()}').fadeIn(0)})" class="fa fa-angle-double-left hide-asset-expire-button-${article.getId()}" style="cursor: pointer; margin-left: 5px"></i>
    		</span>
    		 <i class="fa fa-angle-double-right show-asset-expire-button-${article.getId()}"
		        style="cursor: pointer; margin: 0 10px" onclick="$(this).fadeOut(0);$('.asset-expire-button-${article.getId()}').fadeIn(200,function(){})"></i>
    		
		</span>
		<div class="asset-expire-confirm-dialog asset-expire-confirm-dialog-${article.getId()}">
			<p class="expire-confirm-dialog-title">${languageUtil.format(locale, "confirm-expire-x", entryTitle)}</p>
			<div class="expire-confirm-dialog-buttons">
				<button class="btn btn-primary" onclick="${renderResponse.getNamespace()}expire('${article.getId()}'); $('.asset-expire-confirm-dialog-${article.getId()}').fadeOut(200,function(){$('#full-overlay').fadeOut(50)})" type="button">Yes</button>
				<button class="btn" onclick="$('.asset-expire-confirm-dialog-${article.getId()}').fadeOut(200,function(){$('#full-overlay').fadeOut(50)})" type="button">No</button>
			</div>
		</div>
	</#if>
</#macro>

<#macro getArticleImage>
    <#if !imageUrl?contains("article.png")>
        <a href="${viewURL}" style="background-image: url(${assetRenderer.getURLImagePreview(renderRequest)});"></a>
    </#if>

</#macro>