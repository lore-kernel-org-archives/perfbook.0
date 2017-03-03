Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=wDGeYU2LqDT5VjzpoanqikZ+i3E74R79okOerbsIjHQ=;
 b=ekTreteRg1lStpPQK7/nC4CdIuPKw4ZW0NogCEcutJZvM6E8qM70JJ/ZanDHpe7WWm
 Kz2r01N8Lt9V736J28UPDYgw6Ep7wf+8DLBMw00yI2h8kk7y1+k54NzW26geFREaYG7Q
 MB7fnwHXNSdcMfDH3owqgghuFhuP8rEcdicRjNZzNcazJnhsw2woPovv5jjUEZc8hMaE
 O90qLUrOrJT9aKlHqORZfiXicmqtqLPGlPH8/bp4Vx7RMXe9sWim22wYvOBZzNeWPlT+
 SxEjY9MJE4B3807LvRIlNzUk84ETMaZ+visfV7S1HMSQ6Bs0a9PWvZX2FbnLQI5AU570
 cjNw==
Subject: Re: [PATCH 1/2] appendix: Enable hyperlink border in bibliography for
 all layouts
References: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
 <47ad7071-d062-0660-7bdf-4c1899db72ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2308d72d-6cf1-1007-145e-05294f97d281@gmail.com>
Date: Sat, 4 Mar 2017 00:25:59 +0900
MIME-Version: 1.0
In-Reply-To: <47ad7071-d062-0660-7bdf-4c1899db72ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/03/03 21:28, Akira Yokosawa wrote:
>>From ec794a1bd368c5ad381fac0594a254fd6a23f619 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 3 Mar 2017 20:56:59 +0900
> Subject: [PATCH 1/2] appendix: Enable hyperlink border in bibliography for all layouts
> 
> "pdfborder" in bibliography also helps in identifying known broken
> urls. This commit enables the border regardless of layout.

One thing to note:

If a hyperlink crosses page boundary, the hyperlink is wrongly embedded
also in the footer and header strings. As of now, target "1csf" hits this
issue at the bottom of first page of Bibliography (p. 653-654).
This is a well known issue of "hyperref" package, which would cause
a build error in 2c layout. Before enabling the border, we just didn't
notice the issue.
Other target might hit this issue by changes made in bibliography.
Are you OK with this possible ugliness?

                               Thanks, Akira

> 
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  appendix/appendix.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/appendix/appendix.tex b/appendix/appendix.tex
> index e17c5e1..63bf728 100644
> --- a/appendix/appendix.tex
> +++ b/appendix/appendix.tex
> @@ -11,12 +11,12 @@
>    \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
>  }{
>    \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
> -  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
>  }
> +\hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
>  \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy}
> +\hypersetup{pdfborder=0 0 0}
>  \IfTwoColumn{
>    \end{adjustwidth*}\twocolumn
>  }{
> -  \hypersetup{pdfborder=0 0 0}
>  }
>  \include{appendix/ack/ack}
> 

