Return-Path: <SRS0=EmAl=2P=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M83VhBlSldeLCCnVDiPEfORcyeoIzrAGHK5dARjSuRY=;
        b=Vb0L3uX+qPNeZgsBEXgzcK12K8FO0gfF2CJ6YrdKUXom0uLDgyZBxmf5LXorW/0czM
         mmpZnxTrXuK9Iqwp4sdEwdzQqSK1XWohWAzcX2sez1MuyuOBPo704mEAIVSjHEGdmUak
         HcfQqGQ9JkCnMWzb79ytpw5XIE0ENlHXHP2lfs+D13hEoL4c1aPoDRvm0Daw+pSqyuqo
         J7EKp1oj+7YE0G5Fsg2MOVPyCFNar0AkV7r5blY2IdlTxbaS7PGctcDX/j7eFnlEYhBJ
         zFekMlB4LIGpA2junHcDiap1w/acXMLeSo4ohEvaiWy0kljii290yZU3PVBNc/EMx0Qq
         ZQUQ==
Message-ID: <c2b67b62-1d16-b9a8-662b-0df81d2eadfe@gmail.com>
Date: Fri, 14 Oct 2022 18:42:25 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook] memorder: fix a line number reference error
References: <20221014055543.8214-1-zhouzhouyi@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221014055543.8214-1-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

On Fri, 14 Oct 2022 13:55:43 +0800, Zhouyi Zhou wrote:
> In section 15.2.3, "Listing 15.10 shows how to make this work
> reliably on pre-v4.15 Linux kernels running on DEC Alpha, by
> replacing line 19' READ_ONCE() with lockless_dereference()"
> 
> line 19 should be line 18.
Close!

The reference should be to line 18 of Listing 15.9, where the to-be-
replaced READ_ONCE() resides.

I'll submit a patch soon with your Reported-by.

        Thanks, Akira

> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul
> I like Chapter 15 very much as well as other chapters,
> I used to read one paragraph a day when I am travelling ;-)
> 
> I think there is a small line number reference error in chapter
> 15.2.3, ignore me if it is not a error.
> 
> Many Thanks
> Zhouyi
> --
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index c350758d..1839e276 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1279,7 +1279,7 @@ exists (1:r2=x0 /\ 1:r3=1)
>  % \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
>  % ("styleguide: Loosen restriction on comment in litmus test")
>  shows how to make this work reliably on pre-v4.15 Linux kernels running on
> -DEC Alpha, by replacing \clnref{read}'s \co{READ_ONCE()} with
> +DEC Alpha, by replacing \clnref{deref}'s \co{READ_ONCE()} with
>  \apikh{lockless_dereference()},\footnote{
>  	Note that \co{lockless_dereference()} is not needed on v4.15 and
>  	later, and therefore is not available in these later Linux kernels.
