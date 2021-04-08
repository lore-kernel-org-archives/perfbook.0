Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhDHQ7G (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 8 Apr 2021 12:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617901134;
        bh=orvMUkCpqG8ECfjI9GV7+qjydpNNm8PqIOhp0CBvmY8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=k7H9x8Cti1+6Z2Vhkle07ZQbNf/6vZNQiSHDnnV/8UuUMnofaWMmetEaLCJ64njpH
         c5yQd/zbvxPy8Q2GbCq2+rhtZKvrEzG58vZqDC/9aBbCfIoUio7TrC7njBExqD9/jy
         aT4Y1BD9ud7Omkn0qkCeyjt5T389I1NdH6qdACxLM/FUIorBKE8wBvfBmhHwM+EdsJ
         dpdduGyNqhqQISXfFBkEdDfUS19aixuykMfbyV8HyTMCF3a2jsP0PebDQC8F6MCnCa
         ggloP/rvWGKwAXzNMqnAPlVDXiiqgXe3N0JIJeqaGlVI4dend7+/48MzOrv3Sgm2Wj
         XrIOdwR7LEhjA==
Date: Thu, 8 Apr 2021 09:58:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] qqz: Suppress possible orphan heading
Message-ID: <20210408165854.GL4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <892ebe26-b120-a726-434b-97ab25187b53@gmail.com>
 <e5279b3d-ed7f-8b74-5e12-831b6cf39208@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5279b3d-ed7f-8b74-5e12-831b6cf39208@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 08, 2021 at 08:10:19PM +0900, Akira Yokosawa wrote:
> As of Edition.2 and current master, heading of Appendix E.7 is
> orphaned in perfbook.pdf.
> 
> This is because framing of quiz part at the beginning of a section
> implies paragraph break and invalids the afterheading-ness of the
> first question.
> 
> To suppress such an unfortunate result, tweak the \bottomtitlespace
> variable of the "titlesec" package for Appendix E.
> 
> Positive length of \bottomtitlespace prohibits a section title
> to appear in the bottom part of that length and forces the title
> to be on the next page.
> This should be acceptable in Appendix E.
> 
> There exist the same patterns of quick quiz at the beginning of
> a section in the main text as well as in -nq builds, which might
> cause an orphan heading.
> 
> Such cases would be dealt with case by case bases.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I queued and pushed both, thank you!

I tried the following to give LaTeX more choice, which did work, but
I am not sure that it is an improvement.  But maybe it will inspire
something should the current approach fail at some point in the future?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/qqz.sty b/qqz.sty
index 897d1ab6..abecb7e8 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -203,7 +203,9 @@
 }{
 \newcommand{\QuickQAC}[3]{
 	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
-	\section{#2}}
+	\section{#2}
+	This section contains the answer key to the quick quizzes
+	from \cref{#1} on page~\pageref{#1}.}
 }
 
 \IfQqzBg{
