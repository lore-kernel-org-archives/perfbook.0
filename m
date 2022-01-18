Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348857AbiARToj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 18 Jan 2022 14:44:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABCCC061574
        for <perfbook@vger.kernel.org>; Tue, 18 Jan 2022 11:44:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1E10B817A3
        for <perfbook@vger.kernel.org>; Tue, 18 Jan 2022 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642535076;
        bh=6TMYn8jiQV6CcD+sIXb7ag4eM86hjjlxnT2sH6ys97g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qa4IkwiU05dke8Y4kANAowR7+dYgIu/eET9xjDNvO4G4ZdAC1BIiJg484jdwKsK0g
         MgvZkxnP9fsazxmyILX4s26+Rma7E4CSrMtE8Cviv78USpRNvaaIT9bxSGSyUwbRhZ
         fasuEs0f8xlIID9zHlNq1sQlZVk3qLgREv9l9V9lLr5SzHpi8wtQSnSU7X2N/xP7ve
         DLYKs4HsZ6//AdqyhedMdSNAfNyKJvFKBGaF48dwEqh+Mbqxxfi5mMD1pANiWyOrXF
         Sem4BvWKAMYlzFNw8k6fHGdtrEiR0jg05evG/LYJ5S9SQSWYAyzP/GzP0DfSEcEJvI
         FSZ4ScBSemP5Q==
Date: Tue, 18 Jan 2022 11:44:36 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] make a ref item (Liang2018) better
Message-ID: <20220118194436.GI947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220115040606.22618-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115040606.22618-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: akiyks@gmail.com, luyang.co@gmail.com, perfbook@vger.kernel.org

On Sat, Jan 15, 2022 at 12:06:06PM +0800, Zhouyi Zhou wrote:
> make the reference item: Liang2018 better by following the style of
> https://ieeexplore.ieee.org/document/8341980
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Good catch!  Queued and pushed with the usual wordsmithing.

							Thanx, Paul

> ---
> Hi Paul and Akira
> 
> I think we could make the reference item better by following
> the style of https://ieeexplore.ieee.org/document/8341980
> 
> and I invoked 'make' before submitting ;-)
> 
> Thank you for your constant encouragement ;-)
> 
> 
> Thanks
> Zhouyi
> --
>  bib/swtools.bib | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/bib/swtools.bib b/bib/swtools.bib
> index 31ce0025..cab1909d 100644
> --- a/bib/swtools.bib
> +++ b/bib/swtools.bib
> @@ -737,8 +737,11 @@ Michalis Kokologiannakis",
>  @inproceedings{Liang:2018:VTB,
>   title = "Verification of Tree-Based Hierarchical {Read-Copy Update} in the {Linux Kernel}",
>   author = "Lihao Liang and Paul E. McKenney and Daniel Kroening and Tom Melham",
> + day = "19--23",
> + month = "March",
>   year = "2018",
> - booktitle = "2018 Design, Automation {\&amp;} Test in Europe Conference {\&amp;} Exhibition, {DATE} 2018, Dresden, Germany, March 19--23, 2018",
> + booktitle = "2018 Design, Automation {\&} Test in Europe Conference {\&} Exhibition (DATE)",
> + address = "Dresden, Germany",
>   url = "http://www.cs.ox.ac.uk/tom.melham/pub/Liang-2018-VTB.pdf",
>  }
>  
> -- 
> 2.25.1
> 
