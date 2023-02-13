Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBMA6K (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 12 Feb 2023 19:58:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973987ABA
        for <perfbook@vger.kernel.org>; Sun, 12 Feb 2023 16:58:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 47483B80D27
        for <perfbook@vger.kernel.org>; Mon, 13 Feb 2023 00:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676249886;
        bh=s5HsBk0jhsSyrrEMo5YyPw0yjutwvuT1LGWrUuOIMmc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L2IP4oIlwLz+HW861hi/kQVFbTxPHVeBozYcI3IF1wO3MXExP6SuqbtfxtFi3oh5d
         ZVS+4L4IffV/A8eNu/eH5punY7uU3Pcz9ZhmNR9MAGZXzy51tV5WQnsezlk9tahFZj
         Mye3QAIbbpex7AJ78nGTl+fjlgDqDp9ebgW+Jc8Epa91192gnfQ0R15xtmokX7pgZ6
         ubeLPrkvTetIFBhpjcO8XwMKGl8ix1yWCCR9CJy+Qru+MMKkJbaPO4ZMa+pUjFU3cx
         zrRrlwkWBSKNaLiyaF6pk080Ni6jROe8LbFHmsRWn3VJ60Rzill59XObHM+WOsgFdc
         MP9ikP/QU2DVg==
Date: Sun, 12 Feb 2023 16:58:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v3 0/4] debugging: Trivial fixups
Message-ID: <20230213005804.GB2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230212165630.26268-1-sj38.park@gmail.com>
 <1acbe0e5-92ae-fa92-0b1e-0e8ed7d4f8a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1acbe0e5-92ae-fa92-0b1e-0e8ed7d4f8a6@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org, sj@kernel.org

On Mon, Feb 13, 2023 at 08:57:58AM +0900, Akira Yokosawa wrote:
> On Sun, 12 Feb 2023 08:56:26 -0800, SeongJae Park wrote:
> > Changes from v2
> > - Fix subject of patch 1 (Akira Yokosawa)
> > - Remove redundant following sections intro instead of making it
> >   explicit (Akira Yokosawa)
> > 
> > Changes from v1
> > - Use 'qco{}' for quoted strings (patch 1, 2) (Akira Yokosawa)
> > - Explicitly distinguish section and subsection (patch 4) (Paul E.
> >   McKeneeny)
> > 
> > -----
> > 
> > This patchset contains trivial fixups for debugging/, which found while
> > doing Korean translation[1].
> > 
> > [1] https://github.com/sjp38/perfbook-ko_KR
> > 
> > SeongJae Park (4):
> >   debugging: Use \qco{} for 'time' output examples
> >   debugging: Use \co{} and \qco{} for 'git' and 'Fixes:', respectively
> >   debugging: Remove unnecessary space in a sentence
> >   debugging: Remove redundant following sections introduction
> 
> For the series,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul
