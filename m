Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiILOkL (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 12 Sep 2022 10:40:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FA07655
        for <perfbook@vger.kernel.org>; Mon, 12 Sep 2022 07:40:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0536B80D8A
        for <perfbook@vger.kernel.org>; Mon, 12 Sep 2022 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662993604;
        bh=2LlxS3We2SzcwyjP2CPW67A9UNYs8w2n9LaYSq/H4tE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pkkrRNHmDBBHflOxfAgpXn5+gXagKGVylXpZ4bHnDPxcR3Wvk6UR0LjpuVUogMP/W
         /NLW3b88TjMTYl+lRIgblrDtYDS9V9we9GOCn+rkWthJsy2ZZh1Lsvzy+5aE7n3Sut
         DhhLdinnXl4CWyOuz5K4lxnRD3p+K/j4uH63zv0PfiIfqH6CjOaIdk0dXNMQ7/Ojpe
         15SGxkkkOAtFnPkB7f8Ruj9pFs5v6EN1S27TTT8E/0y8vnDvPVa6nvBg/zqMhn+Yxj
         9R1Tq+M09RiMIvkT9U7PsGgqOweLEXgr3re0Ry4Gm40zP8t1OHPfQ6C/dbpLPM/NGi
         Yb1Iya8m9bMzA==
Date: Mon, 12 Sep 2022 07:40:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Missing brackets in Listing 6.x?
Message-ID: <20220912144002.GO246308@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FURQ5+Uo8g2f-qx6_OH+rp9niHcw9tGHUrGuu4Ui423Zg@mail.gmail.com>
 <b160515f-3abf-d4e1-8e6b-8f5d2c4b03a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b160515f-3abf-d4e1-8e6b-8f5d2c4b03a4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Mon, Sep 12, 2022 at 11:23:25PM +0900, Akira Yokosawa wrote:
> On Mon, 12 Sep 2022 06:24:36 -0400, Elad Lahav wrote:
> > I was dumbfounded by  the code in Listing 6.4 and 6.5 until I realized
> > it was missing brackets around "key % h->nbuckets". Feeling all
> > superior I was about to fix that and submit a patch, but as it turns
> > out the source looks just fine (SMPDesign.tex, line 153).
> > 
> > Paul, Akira - does it render properly for you? I've attached a
> > screenshot of the result for comparison.
> 
> Hi Elad,
> 
> Yes, I'm seeing the same issues.
> I think I know what went wrong in those snippets.
> 
> Will post a patch after some testing.

Even better, thank you!

							Thanx, Paul
