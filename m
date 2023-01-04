Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239561AbjADOwc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 4 Jan 2023 09:52:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F283C7E
        for <perfbook@vger.kernel.org>; Wed,  4 Jan 2023 06:52:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E955616C4
        for <perfbook@vger.kernel.org>; Wed,  4 Jan 2023 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672843950;
        bh=NuBXJ6jwBHVUmSv2Z7IsN/2BrKp/Joi00uxjwOz6dc8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=i+z7o4RytlkWL609xwmXbQwIdtzq2l0TKju7l5lmXle1dW6AoJse/SmPfFMpxtwHG
         4rXsjl2KecPHYDAqXlHxJSLuQMrIi2IsPZ4c98kWO6EeGqOPaMZYFk4bGERu1Tq1WS
         P9hSPDdA17GNBWCFXuMfEhPsdZAKzyJ2GJJUs7isQk1jmkK8T8NeOnBCcjMWPAAanf
         KAD93LgQRqRXLuF8kJnjODjopm/VuhMwU2UgN0tSTrnv1Mmt67UYyjl35wpDo54YIt
         r7bOR/SQMbCW8oWPgLjjkVogTIDJS5TfQvD8LVk+D1M+vDkFsEJ9YyoST6iaMhs7R9
         aKIlcgbzuboug==
Date: Wed, 4 Jan 2023 06:52:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/3] Rework epigraphs
Message-ID: <20230104145230.GD4028633@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 04, 2023 at 06:30:42PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I could have made a simple patch to add an \emph{} to the
> \epigraph command at Section 11.1, but I ended up reworking
> all the epigraphs instead.
> 
> Why?
> 
> Because I don't think putting an \emph{} in every \epigraph
> command is the right thing to do. You might miss doing it while
> adding a new one or replacing an existing one.
> 
> Hence the large diff of Patch 1/3.
> 
> Patches 2/3 and 3/3 are more of POCs of tweaking the look of
> epigraphs. You can control it all together by redefining
> \epigraph in the preamble.
> 
> I think emphasizing quoted text and using small-caps shape for
> the source part can make epigraphs look distinct from main text.
> Emphasizing book titles is consistent with the convention in
> Bibliography.
> 
> That said, I'm not sure if you like the modified look of them.
> If you have a better idea, please let me know.

A little change in appearance for the Third Edition is not a bad
thing.  Let's go with it and see what people think.  ;-)

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (3):
>   Redefine \epigraph to avoid boilerplate \emph{}
>   epigraph: Emphasize quoted text and book titles
>   Use Biolinum font family for epigraph
> 
>  SMPdesign/SMPdesign.tex              |  6 +++---
>  SMPdesign/beyond.tex                 |  4 ++--
>  SMPdesign/criteria.tex               |  2 +-
>  SMPdesign/partexercises.tex          |  2 +-
>  ack.tex                              |  2 +-
>  advsync/advsync.tex                  |  6 +++---
>  advsync/rt.tex                       |  4 ++--
>  appendix/questions/questions.tex     |  2 +-
>  appendix/styleguide/styleguide.tex   |  2 +-
>  appendix/toyrcu/toyrcu.tex           |  2 +-
>  appendix/whymb/whymemorybarriers.tex |  2 +-
>  count/count.tex                      | 12 ++++++------
>  cpu/cpu.tex                          |  2 +-
>  cpu/hwfreelunch.tex                  |  2 +-
>  cpu/overheads.tex                    |  2 +-
>  cpu/overview.tex                     |  2 +-
>  cpu/swdesign.tex                     |  2 +-
>  datastruct/datastruct.tex            | 16 ++++++++--------
>  debugging/debugging.tex              | 18 +++++++++---------
>  defer/defer.tex                      |  4 ++--
>  defer/hazptr.tex                     |  2 +-
>  defer/rcu.tex                        |  2 +-
>  defer/seqlock.tex                    |  2 +-
>  defer/updates.tex                    |  2 +-
>  defer/whichtochoose.tex              |  2 +-
>  easy/easy.tex                        | 10 +++++-----
>  formal/axiomatic.tex                 |  2 +-
>  formal/formal.tex                    |  6 +++---
>  formal/ppcmem.tex                    |  2 +-
>  formal/sat.tex                       |  2 +-
>  formal/spinhint.tex                  |  2 +-
>  formal/stateless.tex                 |  2 +-
>  future/cpu.tex                       |  2 +-
>  future/formalregress.tex             |  2 +-
>  future/fp.tex                        |  2 +-
>  future/future.tex                    |  2 +-
>  future/htm.tex                       |  2 +-
>  future/tm.tex                        |  2 +-
>  glossary.tex                         |  4 ++--
>  howto/howto.tex                      | 12 ++++++------
>  intro/intro.tex                      | 12 ++++++------
>  locking/locking-existence.tex        |  2 +-
>  locking/locking.tex                  | 14 +++++++-------
>  memorder/memorder.tex                | 14 +++++++-------
>  owned/owned.tex                      | 14 +++++++-------
>  perfbook-lt.tex                      |  5 ++++-
>  qqz.sty                              |  2 +-
>  summary.tex                          |  2 +-
>  together/applyrcu.tex                |  2 +-
>  together/count.tex                   |  2 +-
>  together/hazptr.tex                  |  2 +-
>  together/refcnt.tex                  |  2 +-
>  together/seqlock.tex                 |  2 +-
>  together/together.tex                |  2 +-
>  toolsoftrade/toolsoftrade.tex        | 10 +++++-----
>  55 files changed, 124 insertions(+), 121 deletions(-)
> 
> 
> base-commit: 81ce330ad5a1a687ef43129373fb1f38bef9dd55
> -- 
> 2.25.1
> 
