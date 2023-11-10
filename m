Return-Path: <perfbook-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC17FC4332F
	for <perfbook@archiver.kernel.org>; Fri, 10 Nov 2023 03:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjKJDPd (ORCPT <rfc822;perfbook@archiver.kernel.org>);
        Thu, 9 Nov 2023 22:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjKJDPc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 9 Nov 2023 22:15:32 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F61A44B8
        for <perfbook@vger.kernel.org>; Thu,  9 Nov 2023 19:15:30 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc5916d578so13992165ad.2
        for <perfbook@vger.kernel.org>; Thu, 09 Nov 2023 19:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699586130; x=1700190930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LtiANVz7T4WDNadA7HxvVb3gSgMisn27L9XRLrnO4w=;
        b=cSHlA3xbV0VBVls/JhhuD68SKgeWU7Ad1o4MDGWL/e3bzaqYfVzNrjzooL/JLvAj9l
         xuBnIPF6LnyiX4fSnUdBsbz2AbanX+/V/gJc8AYqBo9Oe9p6AbnVm2OKGSBwLY5L7jUQ
         p0NuRY1v/q/DIE5RUZM8Yf4lH0JW3BfjJJQpLTd4LmHhFaq9A7CfpqFJb1HKIkBu7Z4c
         0UpqGSPtnKI3QehLxSWxfZHDqouqSJb4admXuOXlzvlvGQWfZOUv29WqxtqHmknSMLGv
         UR255WBLdpBiinG+US+wmQLKOeegYaFSj8Wo0HcaEOEBy6bgBNrNWMvy4IIHfVe6Ve5I
         UFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699586130; x=1700190930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LtiANVz7T4WDNadA7HxvVb3gSgMisn27L9XRLrnO4w=;
        b=r2KQwa2AyS7saULBD+/4TQDIzKJ3297cOBK4g0zv2I3ZDSlldXUs10Fti6FhpQ9mXl
         uw/zBjV/UNg7a0muvWYP0g6+7VGJ3n9QAh3a6EERnGZls9J7sNwKgzWc2EqAAGCmiSmY
         XZmA1a+suyaXArk6nftsizBnWC/w5Nhx2zEyPmHAfupMqKKG0JV5wR90FHp4HTbd4YPn
         OFBeSuFuSpD5UZDXQ0G70S1r6KCGCPPdTgl+bqc4tMExm94hK9aUKc5o4sA8eO9gL97I
         E2VmBiBdjI0SrQR0xuJerTf07czujTmrXmMfnnXthiLlZpt06fDaWcuggL1Ct/4xEe85
         eVpg==
X-Gm-Message-State: AOJu0Yz7hrwOterX9tP3K0qvArShoV6r3XDf65zxBHaHu1On+JW6iJCo
        5Gp/VoZ4++5bNth0fm4ZAdI=
X-Google-Smtp-Source: AGHT+IE/i77ONXxMx4J4DVwZPuuJzGLktRI79yyfTd8S1DZ4kYXkQhg3GPSX7EyES/9wzTOx73FJ/g==
X-Received: by 2002:a17:902:6547:b0:1ca:abe:a08b with SMTP id d7-20020a170902654700b001ca0abea08bmr5239721pln.68.1699586129807;
        Thu, 09 Nov 2023 19:15:29 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b001ca86a9caccsm4233261plx.228.2023.11.09.19.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:15:29 -0800 (PST)
Message-ID: <d6d15279-b2f6-46d1-9d2f-84f9a21985b0@gmail.com>
Date:   Fri, 10 Nov 2023 12:15:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Set PDF metadata from LaTeX title/author commands?
To:     paulmck@kernel.org
Cc:     perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e50d0627-9e73-4afa-b097-ac3de3949cee@paulmck-laptop>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e50d0627-9e73-4afa-b097-ac3de3949cee@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <perfbook.vger.kernel.org>
X-Mailing-List: perfbook@vger.kernel.org

Hi Paul,

On 2023/11/10 9:48, Paul E. McKenney wrote:
> Hello, Akira,
> 
> Is the patch shown below reasonable, or would this mess things up?
> 
> It is nice seeing the title at the top of the "evince" window, but not
> so nice that we should risk anything going wrong.  And I vaguely recall
> this being discussed, but do not see any emails or commits mentioning
> pdfusetitle, so I figured I should ask.  ;-)

I don't remember any discussion about pdfusetitle.

As far as I see, this shouldn't do any harm.

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira


> 
> 						Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 3edff9639ae80c03f0be9e506f053dd3096b74d8
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Thu Nov 9 16:43:48 2023 -0800
> 
>     perfbook-lt: Set PDF metadata from LaTeX title and author
>     
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 3b8cb1cd..ec457599 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -76,7 +76,7 @@
>  \usepackage[nottoc]{tocbibind}
>  \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
>  \usepackage{parnotes} % for footnotes in tabularx
> -\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
> +\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all,pdfusetitle]{hyperref}
>  \usepackage{footnotebackref} % to enable cross-ref of footnote
>  \usepackage[all]{hypcap} % for going to the top of figure and table
>  \usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
