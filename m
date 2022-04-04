Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346615AbiDDDpF (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2022 23:45:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B0539805
        for <perfbook@vger.kernel.org>; Sun,  3 Apr 2022 20:43:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18D04B80DA0
        for <perfbook@vger.kernel.org>; Mon,  4 Apr 2022 03:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649043787;
        bh=PLzItGSLPoVKo87hwknS+2pEafvlwIaaBdVYEbcHnMM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QMQ3omc1SqlGF2TXTlTDYcufgzRRtHvrAjzBJb5de6rT3shXQ4iLns+dxDFDjAtvX
         hpEdEKDKZXGX34C/UQkUaeMaPTfrymf9KMts46BnWNrSYh12YQhV6y8yJSP0YEVE6n
         pdo6eMFGUw0WClkA5LMzAj4QYRgO/ErtjulpeeLB9Y9Qq/sHwVWnTSptZ1z5sZCsyy
         AQxjbJGf101MLv2fxg5IRdgnze1Cx8uXN0MaMgqDfBHAyQCoXO8fMURAWuzAljQrPT
         sX0E5EwINhjTRTwWgInS+UQ+HX7XKUTroQ4SQmdivTGU4tKbletEvl3+bLkCDOYQeG
         Do+joD54TNqtw==
Date: Sun, 3 Apr 2022 20:43:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2 0/3] punctcheck.pl updates
Message-ID: <20220404034307.GT4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 04, 2022 at 09:17:34AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Trying again.
> 
> So, this series adds patterns in punctcheck.pl to detect misuses
> of punctuation markers "\@.", ".\@", and its friends.
> 
> Patch 1/3 adds the new pattern.
> Patch 2/3 adds hint messages to help you and other contributors
> see what is wrong.  Hopefully the added messages are clear enough.
> Patch 3/3 fixes existing misuses detected by the added pattern.

Much nicer!  I queued and pushed all four, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   punctcheck.pl: Add pattern to catch reverse use of period markers
>   punctcheck.pl: Add hints in complaint messages
>   Fix period markers
> 
>  glossary.tex            |  2 +-
>  memorder/memorder.tex   |  2 +-
>  together/applyrcu.tex   |  2 +-
>  utilities/punctcheck.pl | 15 +++++++++++++++
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 5f28b7cb0d4c447c9d6397770906c7cb4c96832c
> -- 
> 2.25.1
> 
