using Uno;
using Uno.Testing;

using FuseTest;

namespace Fuse.Gestures.Test
{
	public class RangeControlTest : TestBase
	{
		[Test]
		public void Orientation()
		{	
			var p = new UX.RangeControlHorizontal();
			using (var root = TestRootPanel.CreateWithChild(p, int2(1000,500)))
			{
				//note the distance is irrelevant so long as the threshold is exceeded, the final location matters
				root.PointerSwipe( float2(100,100), float2(250,100) );
				Assert.AreEqual( 25, p.Value );
				//back
				root.PointerSwipe( float2(700,200), float2(650,200) );
				Assert.AreEqual( 65, p.Value );

				p.LRB.Orientation = Fuse.Layouts.Orientation.Vertical;
				root.PointerSwipe( float2(100,100), float2(100,250) );
				Assert.AreEqual( 50, p.Value );

				root.PointerSwipe( float2(300,450), float2(300,400) );
				Assert.AreEqual( 80, p.Value );
			}
		}
		
		[Test]
		public void LinearUserStep()
		{
			var p = new UX.RangeControl.LinearUserStep();
			using (var root = TestRootPanel.CreateWithChild(p, int2(1000)))
			{
				root.PointerSwipe( float2(100,100), float2(273,100) );
				Assert.AreEqual( 20, p.Value );

				//boundary tests
				root.PointerSwipe( float2(600,100), float2(97,100) );
				Assert.AreEqual( 0, p.Value );
				root.PointerSwipe( float2(600,100), float2(997,100) );
				Assert.AreEqual( 100, p.Value );
			}
		}
		
		[Test]
		public void Properties()
		{
			var p = new UX.RangeControl.Properties();
			using (var root = TestRootPanel.CreateWithChild(p))
			{
				Assert.AreEqual( 20, p.value.Value );
				Assert.AreEqual( 0.6, p.relativeValue.Value );
				Assert.AreEqual( 0.6, p.progress.Value );
				
				p.rc.Value = -50;
				Assert.AreEqual( -50, p.value.Value );
				Assert.AreEqual( 0.25, p.relativeValue.Value );
				Assert.AreEqual( 0.25, p.progress.Value );
			}
		}
		
	}
}
