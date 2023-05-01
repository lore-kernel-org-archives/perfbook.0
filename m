Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjEAQU2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 May 2023 12:20:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A66E61
        for <perfbook@vger.kernel.org>; Mon,  1 May 2023 09:20:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB33613DC
        for <perfbook@vger.kernel.org>; Mon,  1 May 2023 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682958026;
        bh=IJbEM3iAqXZF3y+ry693USMIU48XIGS21HJ+OyIrm9w=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JRJEBQCn1V6a2P/fxMi0Y9W26e6DWF7hHXs71gV/mNmSgd/4uNZYYo4wIEidE2dZC
         uH9kgjjgYh8SkY92YoKFHdwu5TLBERW9ua9PkWhx6eloOGEUQnD50qkU7apbNpssL6
         VeRDRRIrWLLwgZatUF62N8qnq+X41cF4FvA7oYhEUESGTvdxhI/0c9La3bXLh5xJZk
         1ACVWGv1vqfHltP9lh1+u9LF+9x6iNXRtTzS84RdkFMZoD+33e2bt/WD2W9kCetI0+
         dlRFcTBrUBiZbmsgA+GFYZnA4JnX11wbKg3ZC18ljZvF+9M+Y766bZc3HsCslo6rvt
         R1Hko5ZceQiXg==
Date: Mon, 1 May 2023 09:20:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] defer/whichtochoose: Make paragraph consistent with table
Message-ID: <400ede1f-d3c9-4146-9e15-9a88c892dacf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230501151112.24312-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501151112.24312-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, May 01, 2023 at 03:11:12PM +0000, Alan Huang wrote:
> The second row of table 9.7 has been changed since 82c89c8.
> So make the paragraph consistent with the table.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Good eyes, queued and pushed, thank you!

							Thanx, Paul

> ---
>  defer/whichtochoose.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index 10cb760e..af5a09c3 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -85,7 +85,7 @@ The ``Readers'' row summarizes the results presented in
>  which shows that all but \IXalt{reference counting}{reference count}
>  enjoy reasonably fast and scalable readers.
>  
> -The ``Number of Protected Objects'' row evaluates each technique's need
> +The ``Memory Overhead'' row evaluates each technique's need
>  for external storage with which to record reader protection.
>  RCU relies on quiescent states, and thus needs no storage to represent
>  readers, whether within or outside of the object.
> -- 
> 2.34.1
> 
