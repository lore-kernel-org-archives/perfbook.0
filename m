Return-Path: <perfbook-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A662DC4167B
	for <perfbook@archiver.kernel.org>; Fri, 10 Nov 2023 00:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjKJAse (ORCPT <rfc822;perfbook@archiver.kernel.org>);
        Thu, 9 Nov 2023 19:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjKJAsd (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 9 Nov 2023 19:48:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E533253
        for <perfbook@vger.kernel.org>; Thu,  9 Nov 2023 16:48:31 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A51C433C8;
        Fri, 10 Nov 2023 00:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699577310;
        bh=WiNaRzbhoVe2gr9gd5+S9SlEFvGZd+6Iudpf4soRR7I=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=qidthaIhhGVUyJW9F3Bhrbv0JXqXiUntAK//gJMM0KAUtB/EoxlG6peGonXPFPMXX
         udteyXyf6qrZx2dTIusmV/99+ZWMe7sgBuTGX+M/EgREjI38wOfXpkGS6INAbVucLL
         b0u6EZrjL8PGHMJCSGzo5D9apiw8IWaPlxFTpovrAqjRKIO2wc2XatcIaMCwe54Ppj
         mnPHbEVPGSdHdI+YOl0FAQkkL2E0Luv3jgJa2BGxE6iY2sgL0u68Qym+utJz/FLt84
         vgzyVI6DwQcMORNK43tlI6yZF4JrzOtXAcQxfm/69KBrhVurWQ8eyMhag7WGbNogH0
         OWo44KpP9X8vQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 42E5CCE1999; Thu,  9 Nov 2023 16:48:29 -0800 (PST)
Date:   Thu, 9 Nov 2023 16:48:29 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     akiyks@gmail.com
Cc:     perfbook@vger.kernel.org
Subject: Set PDF metadata from LaTeX title/author commands?
Message-ID: <e50d0627-9e73-4afa-b097-ac3de3949cee@paulmck-laptop>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <perfbook.vger.kernel.org>
X-Mailing-List: perfbook@vger.kernel.org

Hello, Akira,

Is the patch shown below reasonable, or would this mess things up?

It is nice seeing the title at the top of the "evince" window, but not
so nice that we should risk anything going wrong.  And I vaguely recall
this being discussed, but do not see any emails or commits mentioning
pdfusetitle, so I figured I should ask.  ;-)

						Thanx, Paul

------------------------------------------------------------------------

commit 3edff9639ae80c03f0be9e506f053dd3096b74d8
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Nov 9 16:43:48 2023 -0800

    perfbook-lt: Set PDF metadata from LaTeX title and author
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 3b8cb1cd..ec457599 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -76,7 +76,7 @@
 \usepackage[nottoc]{tocbibind}
 \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
 \usepackage{parnotes} % for footnotes in tabularx
-\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
+\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all,pdfusetitle]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
 \usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
