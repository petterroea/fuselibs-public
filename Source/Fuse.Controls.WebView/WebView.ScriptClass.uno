using Uno;
using Uno.UX;

using Fuse.Scripting;

namespace Fuse.Controls
{
	/** The native WebView for iOS & Android
		@scriptmodule FuseJS/Push

		@include Docs/Guide.md
	*/
	public partial class WebView
	{
		static WebView()
		{
			ScriptClass.Register(typeof(WebView),
				new ScriptMethod<WebView>("goto", setUrl),
				new ScriptMethod<WebView>("goBack", goBack),
				new ScriptMethod<WebView>("goForward", goForward),
				new ScriptMethod<WebView>("reload", reload),
				new ScriptMethod<WebView>("stop", stop),
				new ScriptMethod<WebView>("loadHtml", loadHtml),
				new ScriptMethod<WebView>("setBaseUrl", setBaseUrl));
		}

		/**
			Loads an HTML document from the string provided.

			@scriptmethod loadHtml(html)
			@scriptmethod loadHtml(html, baseUrl)
			@param html The document to load into the WebView.
			@param baseUrl Specifies the base URL used to resolve relative locations in the @html parameter.
		*/
		static void loadHtml(WebView view, object[] args)
		{

			switch(args.Length)
			{
				case 1:
					view.LoadHtml(args[0] as string);
					return;
				case 2:
					view.LoadHtml(args[0] as string, args[1] as string);
					return;
				default:
					Fuse.Diagnostics.UserError("WebView.loadHtml takes either one url argument, or an url and a baseUrl argument", view);
					return;
			}

		}

		/**
			Go back to the previous page.

			@scriptmethod goBack()
		*/
		static void goBack(WebView view, object[] args)
		{
			switch(args.Length)
			{
				case 0:
					view.GoBack();
					return;
				default:
					Fuse.Diagnostics.UserError( "WebView.goBack does not take any arguments", view);
					return;
			}
		}

		/**
			Go forward to the next page.

			@scriptmethod goForward()
		*/
		static void goForward(WebView view, object[] args)
		{
			switch(args.Length)
			{
				case 0:
					view.GoForward();
					return;
				default:
					Fuse.Diagnostics.UserError( "WebView.goForward does not take any arguments", view);
					return;
			}
		}

		/**
			Reload the current page.

			@scriptmethod reload()
		*/
		static void reload(WebView view, object[] args)
		{
			switch(args.Length)
			{
				case 0:
					view.Reload();
					return;
				default:
					Fuse.Diagnostics.UserError( "WebView.reload does not take any arguments", view);
					return;
			}
		}


		/**
			Stop loading the page.

			@scriptmethod stop()
		*/
		static void stop(WebView view, object[] args)
		{
			switch(args.Length)
			{
				case 0:
					view.Stop();
					return;
				default:
					Fuse.Diagnostics.UserError( "WebView.stop does not take any arguments", view);
					return;
			}
		}

		/**
			Load a URL in the WebView.

			@scriptmethod goto(url)
			@param url The location to load.
		*/
		static void setUrl(WebView view, object[] args)
		{
			switch(args.Length)
			{
				case 1:
					view.Url = args[0] as string;
					return;
				default:
					Fuse.Diagnostics.UserError( "WebView.setUrl requires 1 string argument", view);
					return;
			}
		}

		/**
			Sets the base url used to resolve relative requests on a page (loaded via @loadHtml)

			@scriptmethod setBaseUrl(baseUrl)
			@param baseUrl The base URL used to resolve relative locations.
		*/
		static void setBaseUrl(WebView view, object[] args)
		{
			switch(args.Length)
			{
				case 1:
					view.BaseUrl = args[0] as string;
					return;
				default:
					Fuse.Diagnostics.UserError( "WebView.setBaseUrl requires 1 string argument", view );
					return;
			}
		}
	}
}
