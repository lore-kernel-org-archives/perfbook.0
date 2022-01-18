Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:48906 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237637AbiARTD7 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 18 Jan 2022 14:03:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B96DC61543
        for <perfbook@vger.kernel.org>; Tue, 18 Jan 2022 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642532638;
        bh=Wj33TgLO6L2F/RYIAQXgJZd7wKQ/Tfa2zJ/DrjChnuo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AZziNcpZbm7GPDwWPjnYWuS86AL2l4mIqBOdVBmttZlK/lI4p07wydX4FlkUI3hYI
         Yd/PN+mbvZj68Kcj+rJ7T/JQN6kfx819erBFbOHYeOk9SLNhpYfKnLveayYt2TjgYI
         MLyN4gwuKoR8tgv5KvWeTqC9NIqW+1UM51lpDdtYHe1S4PwYw9Hn1Expv/edCtIQqI
         K2hkKasSfUgu8tPJGGIjhIlQe4PEadbIznEAmb+ZIAjpL6LLRI2iL/DqQmte+TreAa
         JRc+FvOUuQ+AasN0Cjn+SaPqSabP7oR7yhlpUlq8qmbpG8uhN1lxVeximRHIdXJUpx
         I/fY9easT2s3Q==
Date: Tue, 18 Jan 2022 11:03:57 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/6] index: Support emphasized page numbers
Message-ID: <20220118190357.GH947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 18, 2022 at 07:51:06PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So this patch set is an update of the WIP series you looked at the
> other day.
> 
> Changes since WIP (other than change logs):
> 
>   1/6, 5/6: Preserve adjusted .idx files as $basename-adjust.idx.
>       Add adjustment samples in header of adjustindexformat.pl.
>   6/6: Concise prenote of general index.

Looks good, queued and pushed, thank you!

And yes, I will be adding more to the glossary.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   index: Initial page number format support
>   locking, defer: POC of bold face page number in index
>   defer: POC of hierarchical index with modifier part's case preserved
>   index: Add prenotes of legends
>   index, glossary: Underline page numbers in Glossary
>   index: Retouch prenotes
> 
>  defer/rcu.tex                  |   2 +-
>  defer/rcufundamental.tex       |   2 +-
>  defer/rcuintro.tex             |   2 +-
>  glossary.tex                   | 176 ++++++++++++++++-----------------
>  glsdict.tex                    |  10 +-
>  locking/locking.tex            |   4 +-
>  perfbook-lt.tex                |  67 ++++++++++++-
>  utilities/adjustindexformat.pl |  42 ++++++++
>  utilities/runlatex.sh          |   2 +
>  9 files changed, 211 insertions(+), 96 deletions(-)
>  create mode 100755 utilities/adjustindexformat.pl
> 
> 
> base-commit: bf4794df366d2cf87c2e9cf177f5169081138a23
> -- 
> 2.17.1
> 
> 
