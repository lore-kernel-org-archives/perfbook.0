Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjBGBRm (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 6 Feb 2023 20:17:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97A71D90E
        for <perfbook@vger.kernel.org>; Mon,  6 Feb 2023 17:17:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E08161070
        for <perfbook@vger.kernel.org>; Tue,  7 Feb 2023 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675732660;
        bh=mD2EiZQZmYUZsrYx2begD7l65HlPgtc8G0iycT8dTrw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=BE2BdeRAE1DfvXJaPVsf0teUIg9cQ2ar8iaDeiDooSS/dBIQzzCIh8BSh/a8fU8rh
         AkV+c4GRShaqXv1zOboM61sILpD07RQuW1n9AL8s8gzyLyG54dyMHuia3haPM0SHN4
         on7gfC2QIs6h7AxnqgPHnDCZC+Hd03TBXRhxZI5U+wr1nZQdHUGTh5VlEalN2Kg/67
         Limnm3kum4kLiAlhxp4uiIV/U2Cnjqecvn1LPJMM6nS54z7JjqhOrR9D24yhwx7wdU
         YQRuRE3FR7TmxI8eupjxy/u3XRhLlWRABiPzwRkxin4dWF3pOfqR8rpUPegSmGJ1Vy
         I/fX2L2UCje/A==
Date: Mon, 6 Feb 2023 17:17:40 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v1] utilities/gitlab-ci: Change base machine type to
 2-cpu to fix make check
Message-ID: <20230207011740.GV2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230206205514.442896-1-leobras.c@gmail.com>
 <e983bd58-3a43-8138-cf57-7f7a44f52cfb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e983bd58-3a43-8138-cf57-7f7a44f52cfb@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Tue, Feb 07, 2023 at 09:19:09AM +0900, Akira Yokosawa wrote:
> On Mon,  6 Feb 2023 17:55:15 -0300, Leonardo Bras wrote:
> > `make -C CodeSamples/ check` currently fails on Gitlab-CI.
> > 
> > Failure happen on sched_setaffinity:
> > sched_setaffinity: Invalid argument
> > 
> > Further debuging, it's possible to notice that some tests are trying to set
> > the cpu affinity in CPUs 0 and 1, so at least 2 cpus are needed for the
> > test to run properly.
> > 
> > Current (default) saas-linux-small-amd64 instances used for testing on
> > Gitlab-CI only offer a single CPU, which is not enough.
> > 
> > For the test_codesamples pre-test, change the instance type to
> > saas-linux-medium-amd64 so the tests can run properly.
> > 
> > Fixes: 9217963c ("utilities/gitlab-ci.yml: Add 'make check' on
> > test_codesamples")
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> Hi,
> 
> I see that this change worked at:
> 
>     https://gitlab.com/linux-kernel/perfbook/-/jobs/3723917786
> 
> So FWIW,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you both!

> I don't have a list of minimum CPU count for programs under
> CodeSamples/, but I guess there are a few which need more than
> two CPUs.
> 
> You might need to add conditionals in Makefile to exclude those
> tests depending on available CPU count.

In addition, some of the tests may need special command-line arguments.
For example, most of the tests that take "--smoketest" probably want to
use that argument for "make check".

One thought is to take this one directory at a time.  Any better ideas?

							Thanx, Paul

>         Thanks, Akira
> 
> > ---
> >  utilities/gitlab-ci.yml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index 9545029e..42eda60f 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -5,6 +5,7 @@ stages:
> >    - build
> >  
> >  test_codesamples:
> > +    tags: [ saas-linux-medium-amd64 ]
> >      stage: test
> >  
> >      before_script:
