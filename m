Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbhADAcu (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 3 Jan 2021 19:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609720327;
        bh=ce6iU5t+D2sD5zjE6m3LpND8zZ+65dB/uV0kUxmsem8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QYbQlO+/KGl961QxPLRfCRJ5HXalhEmXVp2k9P+9WpIHdFh8r8CdXi2CUxxZRJRFQ
         893/4AGf30oc3msCe0CieZvMP+8dca3g9zhV2vcQIrw2pha4xNGgRxvjqiDcGulbRI
         FHMcwRLzbgNYkGFMaUBQxG5zA+iv/btt/XY3NeW6qYpbegReA3L58YeFo1d1dmJhb/
         oU8JzfffUWVmgzm36tEOAYJrsM6y1wliB/ooAXjNuTHpIUKZBNgvdlljWFpNZ5IALO
         IhJdgQiYr7utdZ5sPPzmlDl9YyCohDQdC5vX/bkSElQm1sOUQlbFYSuObgKb5V3WFy
         bUP3fA5mX7ixw==
Date: Sun, 3 Jan 2021 16:32:07 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Request for clarification on Alpha reordering
Message-ID: <20210104003207.GA6191@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
 <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
 <20210103182429.GG12032@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103182429.GG12032@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Daniel Nitzan <danny.nitzan@gmail.com>, perfbook@vger.kernel.org

On Sun, Jan 03, 2021 at 10:24:29AM -0800, Paul E. McKenney wrote:
> On Sun, Jan 03, 2021 at 01:12:40PM +0900, Akira Yokosawa wrote:
> > On Sat, 2 Jan 2021 19:52:50 -0800, Paul E. McKenney wrote:
> > > On Sun, Jan 03, 2021 at 12:04:24AM +0200, Daniel Nitzan wrote:
> > >> In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
> > >> does mean that Alpha can in effect fetch the data pointed to before it
> > >> fetches the pointer itself, strange but true."
> > >> I'd appreciate it if someone could clarify what this means. I don't
> > >> understand this statement in light of the actual data-dependent
> > >> reordering presented in this section, i.e. the pointer itself is
> > >> fetched, points to the correct location in memory, but the data is
> > >> stale.
> > > 
> > > Yes, your last statement is equivalent.  Either way, the reading CPU sees
> > > the new value of the pointer and the old value of the pointed-to data.
> > > You can look at it either as counter-intuitive reordering (as I did)
> > > or as counter-intuitive stale data (as you did).
> > > 
> > > The key point is that these values are not in a single location, but
> > > are instead replicated across the CPUs' caches.  Stores are therefore
> > > not atomic unless the hardware goes to a lot of trouble to make them
> > > appear to be atomic.
> > 
> > Hi Paul,
> > 
> > Off topic, but smp_read_barrier_depends() as a kernel API
> > has been removed since Linux v5.9 [1].
> > Now READ_ONCE() for Alpha uses mb() [2].
> > 
> > You might want to reflect these changes in perfbook before the
> > release of the Second Edition.
> > 
> > [1]: merge commit https://git.kernel.org/linus/145ff1ec090d
> >     ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")
> > [2]: commit https://git.kernel.org/linus/d64628588515
> >     ("alpha: Override READ_ONCE() with barriered implementation")
> 
> Good catch, thank you!  We will of course need to retain mention of
> smp_read_barrier_depends() given that people will be using pre-v4.15
> (to say nothing of pre-v5.9) kernels for some time, but the main code
> does need to reflect the current state of the Linux kernel.
> 
> Perhaps in the third edition we should drop any and all references
> to DEC Alpha.  It is no longer in any way special, at least from the
> perspective of core kernel code.  ;-)
> 
> I suppose that the counter-argument is that non-Linux-kernel code might
> still need to pay attention, so maybe DEC Alpha needs to stay until such
> time as C/C++ handle address and data dependencies.  Worth some thought.

In the meantime, how about like this?

							Thanx, Paul

------------------------------------------------------------------------

commit ce1c64290718fc1fde246e3535e9b58a64010acc
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Sun Jan 3 16:30:03 2021 -0800

    memorder: Update Alpha discussion based on v5.9
    
    Version v5.9 of the Linux kernel removed smp_read_barrier_depends()
    and read_barrier_depends().  This commit therefore updates the
    discussion of DEC Alpha accordingly.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/memorder/Alpha.svg b/memorder/Alpha.svg
index b8eef6c..13a194b 100644
--- a/memorder/Alpha.svg
+++ b/memorder/Alpha.svg
@@ -13,12 +13,12 @@
    xmlns="http://www.w3.org/2000/svg"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
-   width="294.55206"
-   height="172.38805"
-   viewBox="-12 -12 3953.5431 2296.2975"
+   width="286.08585"
+   height="172.3885"
+   viewBox="-12 -12 3839.9076 2296.3036"
    id="svg2"
    version="1.1"
-   inkscape:version="0.48.4 r9939"
+   inkscape:version="0.92.3 (2405546, 2018-03-11)"
    sodipodi:docname="Alpha.svg">
   <metadata
      id="metadata160">
@@ -28,7 +28,7 @@
         <dc:format>image/svg+xml</dc:format>
         <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-        <dc:title />
+        <dc:title></dc:title>
       </cc:Work>
     </rdf:RDF>
   </metadata>
@@ -43,8 +43,8 @@
        style="overflow:visible">
       <path
          id="path3935"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)"
          inkscape:connector-curvature="0" />
     </marker>
@@ -57,8 +57,8 @@
        style="overflow:visible">
       <path
          id="path3932"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)"
          inkscape:connector-curvature="0" />
     </marker>
@@ -86,8 +86,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3932-6"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)" />
     </marker>
     <marker
@@ -100,8 +100,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3935-5"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)" />
     </marker>
     <marker
@@ -114,8 +114,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3932-62"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)" />
     </marker>
     <marker
@@ -128,8 +128,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3935-1"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)" />
     </marker>
     <marker
@@ -142,8 +142,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path4970"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)" />
     </marker>
     <marker
@@ -156,8 +156,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path4974"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)" />
     </marker>
     <marker
@@ -170,8 +170,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3932-9"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)" />
     </marker>
     <marker
@@ -184,8 +184,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3935-6"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)" />
     </marker>
     <marker
@@ -198,8 +198,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3932-2"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)" />
     </marker>
     <marker
@@ -212,8 +212,8 @@
       <path
          inkscape:connector-curvature="0"
          id="path3935-18"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)" />
     </marker>
     <marker
@@ -225,8 +225,8 @@
        style="overflow:visible">
       <path
          id="path3932-27"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(0.4,0,0,0.4,4,0)"
          inkscape:connector-curvature="0" />
     </marker>
@@ -239,8 +239,8 @@
        style="overflow:visible">
       <path
          id="path3935-2"
-         d="M 0,0 5,-5 -12.5,0 5,5 0,0 z"
-         style="fill-rule:evenodd;stroke:#000000;stroke-width:1pt"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt"
          transform="matrix(-0.4,0,0,-0.4,-4,0)"
          inkscape:connector-curvature="0" />
     </marker>
@@ -254,25 +254,31 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="1321"
+     inkscape:window-width="1657"
      inkscape:window-height="995"
      id="namedview156"
-     showgrid="false"
+     showgrid="true"
      inkscape:zoom="4.0807726"
      inkscape:cx="147.27603"
-     inkscape:cy="86.194023"
-     inkscape:window-x="720"
+     inkscape:cy="86.194482"
+     inkscape:window-x="384"
      inkscape:window-y="207"
      inkscape:window-maximized="0"
      inkscape:current-layer="svg2"
      fit-margin-top="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     fit-margin-left="5" />
+     fit-margin-left="5">
+    <inkscape:grid
+       type="xygrid"
+       id="grid988"
+       originx="-1.320013e-05"
+       originy="0.0061278563" />
+  </sodipodi:namedview>
   <path
      inkscape:connector-curvature="0"
      id="path4548-3"
-     d="m 457.03251,1242.0362 3.69114,625.6094 2085.45475,-1.7786 6.0959,-619.8716"
+     d="m 457.03249,1242.0362 3.6911,625.6094 2085.45471,-1.7786 6.0959,-619.8716"
      style="fill:none;stroke:#000000;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:none;marker-end:url(#Arrow1Mend)"
      sodipodi:nodetypes="cccc" />
   <rect
@@ -281,16 +287,16 @@
      rx="0"
      height="233.50861"
      width="1499.6387"
-     y="516.34772"
-     x="58.611111" />
+     y="516.34778"
+     x="58.611107" />
   <text
-     style="font-size:108px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+     style="font-style:normal;font-weight:normal;font-size:108px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
      id="text106"
      font-size="108"
      font-weight="normal"
      font-style="normal"
-     y="666.34778"
-     x="808.138"
+     y="666.34784"
+     x="808.13794"
      xml:space="preserve"><tspan
        id="tspan3035"
        style="font-size:134.222229px">Writing CPU Core</tspan></text>
@@ -300,15 +306,15 @@
      rx="0"
      height="233.50859"
      width="1499.6385"
-     y="516.34778"
+     y="516.34784"
      x="2171.4749" />
   <text
-     style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+     style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
      id="text106-0"
      font-size="108"
      font-weight="normal"
      font-style="normal"
-     y="666.34772"
+     y="666.34778"
      x="2921.0017"
      xml:space="preserve"><tspan
        id="tspan3035-9"
@@ -319,11 +325,11 @@
      rx="0"
      height="496.39597"
      width="748.91064"
-     y="744.97589"
-     x="58.611111" />
+     y="744.97595"
+     x="58.611107" />
   <g
      style="fill:none;stroke-width:0.025in"
-     transform="translate(-16.389007,838.26375)"
+     transform="translate(-16.389013,838.26376)"
      id="g3133">
     <text
        xml:space="preserve"
@@ -333,7 +339,7 @@
        font-weight="normal"
        font-size="108"
        id="text106-3"
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"><tspan
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"><tspan
          style="font-size:134.22221375px"
          id="tspan3035-5">Cache</tspan><tspan
          style="font-size:134.22221375px"
@@ -348,7 +354,7 @@
        font-weight="normal"
        font-size="108"
        id="text106-3-7"
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"><tspan
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"><tspan
          style="font-size:134.22221375px"
          id="tspan3131">Bank 0</tspan></text>
   </g>
@@ -358,14 +364,14 @@
      rx="0"
      height="496.39597"
      width="748.91064"
-     y="744.97589"
-     x="809.33917" />
+     y="744.97595"
+     x="809.33911" />
   <g
      style="fill:none;stroke-width:0.025in"
      id="g3133-6"
-     transform="translate(740.56841,838.26375)">
+     transform="translate(740.56839,838.26376)">
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-2"
        font-size="108"
        font-weight="normal"
@@ -380,7 +386,7 @@
          id="tspan3077-2"
          style="font-size:134.22221375px" /></text>
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-7-7"
        font-size="108"
        font-weight="normal"
@@ -393,10 +399,10 @@
   </g>
   <g
      id="g3133-3"
-     transform="translate(2096.4731,757.73044)"
+     transform="translate(2096.4731,757.73045)"
      style="fill:none;stroke-width:0.025in">
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-6"
        font-size="108"
        font-weight="normal"
@@ -411,7 +417,7 @@
          id="tspan3077-26"
          style="font-size:134.22221375px" /></text>
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-7-1"
        font-size="108"
        font-weight="normal"
@@ -422,7 +428,7 @@
          id="tspan3131-8"
          style="font-size:134.22221375px">Bank 0</tspan></text>
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-7-1-2"
        font-size="108"
        font-weight="normal"
@@ -435,7 +441,7 @@
   </g>
   <rect
      x="2171.4731"
-     y="744.97589"
+     y="744.97595"
      width="748.91064"
      height="496.39597"
      rx="0"
@@ -447,59 +453,57 @@
      rx="0"
      height="496.39597"
      width="748.91064"
-     y="744.97589"
+     y="744.97595"
      x="2922.2009" />
   <text
-     sodipodi:linespacing="125%"
      id="text3307"
      y="124.1515"
-     x="46.355312"
-     style="font-size:161.06666565px;font-style:normal;font-weight:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
+     x="46.355247"
+     style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
      xml:space="preserve"><tspan
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Liberation Mono;-inkscape-font-specification:Liberation Mono"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';text-align:start;writing-mode:lr-tb;text-anchor:start"
        y="124.1515"
-       x="46.355312"
+       x="46.355247"
        sodipodi:role="line"
        id="tspan3523">p-&gt;data = key;</tspan><tspan
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Liberation Mono;-inkscape-font-specification:Liberation Mono"
-       y="258.37375"
-       x="46.355312"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';text-align:start;writing-mode:lr-tb;text-anchor:start"
+       y="258.37372"
+       x="46.355247"
        sodipodi:role="line"
        id="tspan3527">smp_wmb();</tspan><tspan
        id="tspan3311"
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Liberation Mono;-inkscape-font-specification:Liberation Mono"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';text-align:start;writing-mode:lr-tb;text-anchor:start"
        y="392.59595"
-       x="46.355312"
+       x="46.355247"
        sodipodi:role="line">head.next = p;</tspan></text>
   <text
-     sodipodi:linespacing="125%"
      id="text3307-0"
      y="258.37375"
-     x="2159.219"
-     style="font-size:161.06666565px;font-style:normal;font-weight:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
+     x="3694.3865"
+     style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
      xml:space="preserve"><tspan
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Liberation Mono;-inkscape-font-specification:Liberation Mono"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';text-align:end;writing-mode:lr-tb;text-anchor:end"
        y="258.37375"
-       x="2159.219"
+       x="3694.3865"
        id="tspan3309-3"
-       sodipodi:role="line">p = READ_ONCE(head.next);</tspan><tspan
+       sodipodi:role="line">p = READ_ONCE_OLD(head.next);</tspan><tspan
        id="tspan3311-4"
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Liberation Mono;-inkscape-font-specification:Liberation Mono"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';text-align:end;writing-mode:lr-tb;text-anchor:end"
        y="392.59598"
-       x="2159.219"
+       x="3694.3865"
        sodipodi:role="line">BUG_ON(p &amp;&amp; p-&gt;key != key);</tspan></text>
   <path
      inkscape:connector-curvature="0"
      id="path4548-3-5"
-     d="m 1191.4495,1240.2417 -2.5266,977.0876 2101.3376,1.9125 2.0321,-965.3072"
+     d="m 1191.4494,1240.2417 -2.5266,977.0876 2101.3377,1.9125 2.0321,-965.3072"
      style="fill:none;stroke:#000000;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:none;marker-end:url(#Arrow1Mend)"
      sodipodi:nodetypes="cccc" />
   <g
      id="g3133-3-4"
-     transform="translate(2840.9506,744.75779)"
+     transform="translate(2840.9505,744.7578)"
      style="fill:none;stroke-width:0.025in">
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-6-3"
        font-size="108"
        font-weight="normal"
@@ -514,7 +518,7 @@
          id="tspan3077-26-0"
          style="font-size:134.22221375px" /></text>
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-7-1-8"
        font-size="108"
        font-weight="normal"
@@ -525,7 +529,7 @@
          id="tspan3131-8-9"
          style="font-size:134.22221375px">Bank 1</tspan></text>
     <text
-       style="font-size:107.99999237px;font-style:normal;font-weight:normal;text-anchor:middle;fill:#000000;stroke-width:0.025in;font-family:Helvetica"
+       style="font-style:normal;font-weight:normal;font-size:107.99999237px;line-height:0%;font-family:Helvetica;text-anchor:middle;fill:#000000;stroke-width:0.025in"
        id="text106-3-7-1-2-2"
        font-size="108"
        font-weight="normal"
@@ -538,36 +542,34 @@
   </g>
   <text
      xml:space="preserve"
-     style="font-size:161.06666565px;font-style:normal;font-weight:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
+     style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
      x="2237.8979"
      y="1477.1736"
-     id="text3498"
-     sodipodi:linespacing="125%"><tspan
+     id="text3498"><tspan
        sodipodi:role="line"
        id="tspan3500"
        x="2237.8979"
        y="1477.1736"
-       style="font-size:107.3777771px">head.next</tspan></text>
+       style="font-size:107.3777771px;line-height:1.25;font-family:sans-serif">head.next</tspan></text>
   <text
      xml:space="preserve"
-     style="font-size:161.06666565px;font-style:normal;font-weight:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
+     style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
      x="3328.4541"
      y="1456.3586"
-     id="text3498-3"
-     sodipodi:linespacing="125%"><tspan
+     id="text3498-3"><tspan
        sodipodi:role="line"
        id="tspan3500-1"
        x="3328.4541"
        y="1456.3586"
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Sans;-inkscape-font-specification:Sans">p-&gt;key</tspan><tspan
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;writing-mode:lr-tb;text-anchor:start">p-&gt;key</tspan><tspan
        sodipodi:role="line"
        x="3328.4541"
-       y="1590.5808"
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Sans;-inkscape-font-specification:Sans"
+       y="1590.5809"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;writing-mode:lr-tb;text-anchor:start"
        id="tspan3529">p-&gt;data</tspan><tspan
        sodipodi:role="line"
        x="3328.4541"
        y="1724.8031"
-       style="font-size:107.3777771px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;writing-mode:lr-tb;text-anchor:start;font-family:Sans;-inkscape-font-specification:Sans"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:107.3777771px;line-height:125%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;writing-mode:lr-tb;text-anchor:start"
        id="tspan3531">p-&gt;next</tspan></text>
 </svg>
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 28b5e43..28c5496 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -434,8 +434,6 @@ memory-ordering instructions at all.
 		   Y &   &   &     &      &   &   &  Y &  Y &     &  Y \\
 	\tco{_relaxed()} RMW operation &  &
 		   Y &   &   &     &      &   &   &  Y &  Y &     &  Y \\
-	\tco{smp_read_barrier_depends()} &  &
-		     & Y &   &     &      &   &   &  Y &  Y &     &    \\
 	\tco{*_dereference()} &  &
 		   Y &   &   &     &      &   &   &  Y &  Y &     &  Y \\
 	Successful \tco{*_acquire()} &   &
@@ -551,15 +549,6 @@ are at most two threads involved.
 	store, which are every bit as good as a \co{READ_ONCE()} and a
 	\co{WRITE_ONCE()}, respectively.
 
-	The \co{smp_read_barrier_depends()} row captures the fact that, with the
-	notable exception of DEC Alpha, compilers and CPUs do not indulge
-	in user-visible breakage of address dependencies, again assuming
-	that these dependencies have been constructed carefully as described in
-	\cref{sec:memorder:Address- and Data-Dependency Difficulties}.
-	However, as of version v4.15 of the Linux kernel, the fact that
-	\co{READ_ONCE()} provides dependency ordering should mean that
-	there is little further need for \co{smp_read_barrier_depends()}.
-
 	The \co{*_dereference()} row captures the address and data
 	dependency ordering provided by \co{rcu_dereference()} and friends.
 
@@ -1859,8 +1848,7 @@ same variable.
 \end{listing}
 
 Dependencies do not provide cumulativity,
-which is why the ``C'' column is blank for
-both the \co{READ_ONCE()} and the \co{smp_read_barrier_depends()} rows
+which is why the ``C'' column is blank for the \co{READ_ONCE()} row
 of \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}.
 However, as indicated by the ``C'' in their ``C'' column,
 release operations do provide cumulativity.
@@ -3873,11 +3861,6 @@ set of memory-ordering primitives, which are as follows:
 	following the memory barrier.
 \item	[\tco{smp_rmb()}] (read memory barrier) that orders only loads.
 \item	[\tco{smp_wmb()}] (write memory barrier) that orders only stores.
-\item	[\tco{smp_read_barrier_depends()}] that forces subsequent operations
-	that depend on prior operations to be ordered.
-	This primitive is a no-op on all platforms except Alpha, but
-	is normally not used directly, but rather as part of
-	something like \co{READ_ONCE()} or \co{rcu_dereference()}.
 \item	[\tco{smp_mb__before_atomic()}] that forces ordering of accesses
 	preceding the \co{smp_mb__before_atomic()} against accesses following
 	a later RMW atomic operation.
@@ -3894,19 +3877,17 @@ The \co{smp_mb()}, \co{smp_rmb()}, and \co{smp_wmb()}
 primitives also force
 the compiler to eschew any optimizations that would have the effect
 of reordering memory optimizations across the barriers.
-The \co{smp_read_barrier_depends()} primitive has a similar effect, but
-only on Alpha CPUs.
 
 These primitives generate code only in SMP kernels, however, several
-have UP versions ({\tt mb()}, {\tt rmb()}, {\tt wmb()},
-and \co{read_barrier_depends()},
-respectively) that generate a memory barrier even in UP kernels. The \co{smp_}
-versions should be used in most cases. However, these latter primitives
-are useful when writing drivers, because MMIO accesses must remain
-ordered even in UP kernels. In absence of memory-ordering operations,
-both CPUs and compilers would happily rearrange these accesses, which at
-best would make the device act strangely, and could crash your kernel or,
-in some cases, even damage your hardware.
+have UP versions ({\tt mb()}, {\tt rmb()}, and {\tt wmb()},
+respectively) that generate a memory barrier even in UP kernels.
+The \co{smp_} versions should be used in most cases.
+However, these latter primitives are useful when writing drivers,
+because MMIO accesses must remain ordered even in UP kernels.
+In absence of memory-ordering operations, both CPUs and compilers would
+happily rearrange these accesses, which at best would make the device
+act strangely, and could crash your kernel or, in some cases, even damage
+your hardware.
 
 So most kernel programmers need not worry about the memory-ordering
 peculiarities of each and every CPU, as long as they stick to these
@@ -3939,8 +3920,17 @@ It may seem strange to say much of anything about a CPU whose end of life
 has long since past, but Alpha is interesting because it is the only
 mainstream CPU that reorders dependent loads, and has thus had outsized
 influence on concurrency APIs, including within the Linux kernel.
-Understanding Alpha is therefore surprisingly important to the Linux kernel
-hacker.
+The need for core Linux-kernel code to accommodate Alpha ended
+with version v4.15 of the Linux kernel, and all traces of this
+accommodation were removed in v5.9 with the removal of the
+\co{smp_read_barrier_depends()} and \co{read_barrier_depends()} APIs.
+This section is nevertheless retained in the Second Edition
+% @@@ Update after release of Second Edition.
+because here in early 2021 there are quite a few Linux kernel hackers
+still working on pre-v4.15 versions of the Linux kernel.
+In addition, the modifications to \co{READ_ONCE()} that permitted
+these APIs to be removed have not necessarily propagated to all
+userspace projects that might still support Alpha.
 
 \begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
 The dependent-load difference between Alpha and the other CPUs is
@@ -3975,13 +3965,13 @@ struct el *insert(long key, long data)
 struct el *search(long key)
 {
 	struct el *p;
-	p = READ_ONCE(head.next);	\lnlbl[h:next]
+	p = READ_ONCE_OLD(head.next);	\lnlbl[h:next]
 	while (p != &head) {
 		/* Prior to v4.15, BUG ON ALPHA!!! */ \lnlbl[BUG]
 		if (p->key == key) {	\lnlbl[key]
 			return (p);
 		}
-		p = READ_ONCE(p->next);	\lnlbl[next]
+		p = READ_ONCE_OLD(p->next);	\lnlbl[next]
 	};
 	return (NULL);
 }
@@ -3992,13 +3982,14 @@ struct el *search(long key)
 \end{listing}
 
 \begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
-Alpha actually allows the code on \clnref{key} of
+Given the pre-v4.15 implementation of \co{READ_ONCE()}, indicated by
+\co{READ_ONCE_OLD()} in the listing, Alpha actually allows the code on
+\clnref{key} of
 \cref{lst:memorder:Insert and Lock-Free Search (No Ordering)}
-could see the old
-garbage values that were present before the initialization on
-\clnrefrange{init:b}{init:e}.
+to see the old garbage values that were present before the initialization
+on \clnrefrange{init:b}{init:e}.
 
-\Cref{fig:memorder:Why smp-read-barrier-depends() is Required}
+\Cref{fig:memorder:fig:memorder:Why smp-read-barrier-depends() is Required in Pre-v4.15 Linux Kernels}
 shows how this can happen on
 an aggressively parallel machine with partitioned caches, so that
 alternating cache lines are processed by the different partitions
@@ -4040,8 +4031,8 @@ in Alpha's heyday.
 \begin{figure}[tbp]
 \centering
 \resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/Alpha}}
-\caption{Why \tco{smp_read_barrier_depends()} is Required}
-\label{fig:memorder:Why smp-read-barrier-depends() is Required}
+\caption{Why \tco{smp_read_barrier_depends()} is Required in Pre-v4.15 Linux Kernels}
+\label{fig:memorder:fig:memorder:Why smp-read-barrier-depends() is Required in Pre-v4.15 Linux Kernels}
 \end{figure}
 
 One could place an \co{smp_rmb()} primitive
@@ -4049,13 +4040,15 @@ between the pointer fetch and dereference in order to force Alpha
 to order the pointer fetch with the later dependent load.
 However, this imposes unneeded overhead on systems (such as \ARM,
 Itanium, PPC, and SPARC) that respect data dependencies on the read side.
-A \co{smp_read_barrier_depends()} primitive has therefore been added to the
-Linux kernel to eliminate overhead on these systems, and was also added
-to \co{READ_ONCE()} in v4.15 of the Linux kernel so that core kernel
-code no longer needs to concern itself with this aspect of DEC Alpha.
+A \co{smp_read_barrier_depends()} primitive was therefore added to the
+Linux kernel to eliminate overhead on these systems, but was removed
+in v5.9 of the Linux kernel in favor of augmenting Alpha's definition
+of \co{READ_ONCE()}.
+Thus, as of v5.9, core kernel code no longer needs to concern itself
+with this aspect of DEC Alpha.
 \begin{fcvref}[ln:memorder:Insert and Lock-Free Search (No Ordering)]
-This \co{smp_read_barrier_depends()} primitive could be inserted in
-place of \clnref{BUG} of
+In older kernels, \co{smp_read_barrier_depends()} primitive could be
+inserted in place of \clnref{BUG} of
 \cref{lst:memorder:Insert and Lock-Free Search (No Ordering)},
 \end{fcvref}
 \begin{fcvref}[ln:memorder:Safe Insert and Lock-Free Search]
@@ -4076,7 +4069,7 @@ Additional logic is required to avoid deadlocks.
 Of course, CPUs that respect data dependencies would define such a barrier
 to simply be \co{smp_wmb()}.
 However, this approach was deemed by the Linux community
-to impose excessive overhead, and furthermore would
+to impose excessive overhead\cite{McKenney01f}, and furthermore would
 not be considered a reasonable approach by those whose systems must meet
 aggressive real-time response requirements.
 
@@ -4117,31 +4110,25 @@ struct el *search(long key)
 The Linux memory-barrier primitives took their names from the Alpha
 instructions, so \co{smp_mb()} is {\tt mb}, \co{smp_rmb()} is {\tt rmb},
 and \co{smp_wmb()} is {\tt wmb}.
-Alpha is the only CPU where \co{smp_read_barrier_depends()} is
-an \co{smp_mb()} rather than a no-op.
+Alpha is the only CPU whose \co{READ_ONCE()} includes an \co{smp_mb()}.
 
 \QuickQuizSeries{%
 \QuickQuizB{
-	Why is Alpha's \co{smp_read_barrier_depends()} an
+	Why does Alpha's \co{READ_ONCE()} include an
 	\co{smp_mb()} rather than \co{smp_rmb()}?
 }\QuickQuizAnswerB{
 	Alpha has only \co{mb} and \co{wmb} instructions,
 	so \co{smp_rmb()} would be implemented by the Alpha \co{mb}
 	instruction in either case.
-	In addition, at the time that \co{smp_read_barrier_depends()}
-	was added to the Linux kernel, it was not clear that
-	Alpha ordered dependent stores, and thus \co{smp_mb()}
-	was therefore the safe choice.
-
-	However, v4.15 of the Linux kernel has added
-	\co{smp_read_barrier_depends()} to \co{READ_ONCE()} and a few
-	of Alpha's atomic read-modify-write operations, thus making it
-	unnecessary to use \co{smp_read_barrier_depends()} anywhere else
-	in the core kernel.
-	This means that other than \co{READ_ONCE()}, no Linux-kernel
-	core code need concern itself with DEC Alpha, thus greatly reducing
-	Paul E.~McKenney's incentive to remove Alpha support from the
-	kernel.
+	In addition, at the time that the Linux kernel started relying on
+	dependency ordering, it was not clear that Alpha ordered dependent
+	stores, and thus \co{smp_mb()} was therefore the safe choice.
+
+	However, given the aforementioned v5.9 changes to \co{READ_ONCE()}
+	and a few of Alpha's atomic read-modify-write operations,
+	no Linux-kernel core code need concern itself with DEC Alpha,
+	thus greatly reducing Paul E.~McKenney's incentive to remove
+	Alpha support from the kernel.
 }\QuickQuizEndB
 %
 \QuickQuizE{
