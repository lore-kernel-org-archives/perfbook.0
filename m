Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbgBCDfC (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 2 Feb 2020 22:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580700901;
        bh=N1gYDndZrOXmHFZQ8eIM5PyAlb9DRwiy+ZVGf8sMJOI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Iw2OIttsAkX5/qbJypTcJbykUggDCHRAsckPpANU0q7GLnV5dWPzEpTkSmtTZBPdv
         Y8oMAe9LgOMurHscs5+SG+NHKhfxeCxajccfW50vy89hEnyBUqXg7naRPOtUpouuR+
         3NCGq4GuYk+cNfPjIQHPd4Ee8RhJy4u+TcnmKm3s=
Date: Sun, 2 Feb 2020 19:35:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Makefile: Add command line for Inkscape 1.0
Message-ID: <20200203033501.GG2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <fc83a817-5da8-2141-da08-73b55aebaaea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc83a817-5da8-2141-da08-73b55aebaaea@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 02, 2020 at 08:25:11AM +0900, Akira Yokosawa wrote:
> >From d29a7d4775aa9e8b148f17ea66d94b5ce661a00f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 1 Feb 2020 22:19:52 +0900
> Subject: [PATCH] Makefile: Add command line for Inkscape 1.0
> 
> Inkscape 1.0 (now in beta) has changed command-line options [1].
> The option "--export-pdf" is no longer available in 1.0.
> Add a conditional command line with the right option of
> "--export-file".
> 
> Tested with inkscape-1.0-0.beta.fc31.4.x86_64.rpm on Fedora 31.
> 
> [1]: https://wiki.inkscape.org/wiki/index.php?title=Using_the_Command_Line#Deprecations_and_Replacements
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I applied all three, thank you!

This patch causes make to output the following near the beginning:

Gtk-Message: 19:27:52.530: Failed to load module "canberra-gtk-module"

Ah, that is just "inkscape --version" complaining.  I can suppress this
complaint as shown below, but that seems inappropriate.  A quick web
search located this:

https://askubuntu.com/questions/342202/failed-to-load-module-canberra-gtk-module-but-already-installed

Which recommends this:

sudo apt install libcanberra-gtk-module libcanberra-gtk3-module

Which cleared things up for me even without the hack below.  So all good!

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/Makefile b/Makefile
index c1a51ba..b5f0224 100644
--- a/Makefile
+++ b/Makefile
@@ -64,7 +64,7 @@ FIG2EPS := $(shell which fig2eps 2>/dev/null)
 A2PING := $(shell which a2ping 2>/dev/null)
 INKSCAPE := $(shell which inkscape 2>/dev/null)
 ifdef INKSCAPE
-  INKSCAPE_ONE := $(shell inkscape --version | grep -c "Inkscape 1")
+  INKSCAPE_ONE := $(shell inkscape --version 2> /dev/null | grep -c "Inkscape 1")
 endif
 LATEXPAND := $(shell which latexpand 2>/dev/null)
 QPDF := $(shell which qpdf 2>/dev/null)
