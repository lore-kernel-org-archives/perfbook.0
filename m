Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJKJs0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 11 Oct 2022 05:48:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF1682610
        for <perfbook@vger.kernel.org>; Tue, 11 Oct 2022 02:48:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0CE061042
        for <perfbook@vger.kernel.org>; Tue, 11 Oct 2022 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665481705;
        bh=u6cjnhsFqlTacrhofMSiy2R2wEMVau4y1r1J4z/twPs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=J+EwWEDD4i8QTIYq5l0wdAE1P+Ph/Qwz51Ymgc7107giArA2pSnR4TLBj2wU4l9Xq
         4OsKFSv2AZGldfhkUhKWfBx3ZuOb5Hz+WfyYEHc4p4N/f2DcN7qooJ/4FWciCsLoKh
         oyIfEcPyjGRmT38C1a0wQHAf6R5IkZRz8CowhFXDCTMudZrbjS5ls/ukIOtVE+RQeg
         bSzftnGMA/6dkI9mbapqL6NfhggSVE+vYDVUq9tLhU7Kj8IifGvEsyq3osgXnpErw4
         +2Q8wgTnaaSHAgbkFx0GGZ7UuOi4gb/Sa955eNVovLQZYgRj4xFtU/wGQEJTTps9tS
         cfyGk3JXAXwyg==
Date: Tue, 11 Oct 2022 02:48:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] memorder.tex: the exists clause in Listing 15.35 should
 never be satisfied.
Message-ID: <20221011094822.GJ4221@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
 <4f53aff4-6bf5-f4e0-6511-00cc040496e5@gmail.com>
 <20221011085825.GE4221@paulmck-ThinkPad-P17-Gen-1>
 <fb96c7ce-2374-aa32-263e-e67fafc1ab9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb96c7ce-2374-aa32-263e-e67fafc1ab9a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Patrick Yingxi Pan <pyxchina92929@gmail.com>, perfbook@vger.kernel.org

On Tue, Oct 11, 2022 at 06:21:16PM +0900, Akira Yokosawa wrote:
> On Tue, 11 Oct 2022 01:58:25 -0700, Paul E. McKenney wrote:
> > On Tue, Oct 11, 2022 at 05:37:55PM +0900, Akira Yokosawa wrote:
> >> [+CC: Paul]
> >>
> >> Hi,
> >>
> >> On Tue, 11 Oct 2022 11:17:25 +0800, Patrick Yingxi Pan wrote:
> >>> Hello!
> >>>
> >>> According to the context and my understanding of locking primitives, I
> >>> suppose the 'exists' clause in the litmus test shouldn't be satisfied.
> >>
> >> I agree with you in that section 15.4.2.2 is described as if the
> >> result were "Never".
> >>
> >> However, if you run herd7 on the litmus test, you'll get:
> >>
> >> ------------------------------------------------
> >> Test Lock-outside-across Allowed
> >> States 4
> >> 0:r1=0; 1:r1=0;
> >> 0:r1=0; 1:r1=1;
> >> 0:r1=1; 1:r1=0;
> >> 0:r1=1; 1:r1=1;
> >> Ok
> >> Witnesses
> >> Positive: 2 Negative: 12
> >> Condition exists (0:r1=0 /\ 1:r1=0)
> >> Observation Lock-outside-across Sometimes 2 12   <--
> >> Time Lock-outside-across 0.02
> >> Hash=06337358bba3d1ed44db8ea81cf1d236
> >> ------------------------------------------------
> >>
> >> That said, I'm not in the position of deciding LKMM is right or not.
> > 
> > Thank you for checking, Akira!
> > 
> > This is the following litmus test?
> > 
> > CodeSamples/formal/herd/C-Lock-outside-across.litmus
> 
> Yes, it is.

Strange.  This is what I get from it on the -rcu dev branch as well
as on v6.0 and v5.19:

$ herd7 -conf linux-kernel.cfg /home/git/perfbook/CodeSamples/formal/herd/C-Lock-outside-across.litmus
Test Lock-outside-across Allowed
States 3
0:r1=0; 1:r1=1;
0:r1=1; 1:r1=0;
0:r1=1; 1:r1=1;
No
Witnesses
Positive: 0 Negative: 3
Condition exists (0:r1=0 /\ 1:r1=0)
Observation Lock-outside-across Never 0 3
Time Lock-outside-across 0.01
Hash=06337358bba3d1ed44db8ea81cf1d236

Am I running a bad version of herd7 or something?

$ herd7 -version
7.56+02~dev, Rev: c375ecc537da22070913496ad2043ae501c7ab78

							Thanx, Paul
