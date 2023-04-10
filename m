Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjDJSOQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Apr 2023 14:14:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710821BD6
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 11:14:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C40E61776
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681150454;
        bh=uRqhf2dBfSKb64XYOWeXp61FlwoCHtbU5bxte3QwObQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YBEto2YCS0wp/yl6cdP2U7qcV6F8dpNHokcffXo2RLnpTgppcemNkFaF1QvEyNlGu
         /ssVujJAbrgHXnS9Kl2SvF+6st51tbG1E6TZYFZB1uTIJrk/WDUubIPjELc8/1GOlN
         9rlEU0Xmd556F3cM8FDA+ogaieDdh4IdGUHK2Zxn6uY+Ckp9rfL3ddD7tg5Zbgb5R+
         DkJdRrtOWoP9yMydcl07NDO39z/fvEvz7llKz4+ABAY92FD6u9dlotw6InWlC9xh4i
         eOnjhuCsXDuxGaz/kNjSGfEEeii9f7ghSzbBs/qqwwD1OrYFNY5UnOeVVS79pD19Dd
         CVY8mZzL6HrQQ==
Date: Mon, 10 Apr 2023 11:14:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question: What does "one thread can enter but two threads can
 exit" mean?
Message-ID: <b84cdc35-2e73-49bb-91ee-25189791016e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <FE0E33DE-C0A0-4065-99CC-5F0AB58E7A67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FE0E33DE-C0A0-4065-99CC-5F0AB58E7A67@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 11, 2023 at 12:40:19AM +0800, Alan Huang wrote:
> Hi,
> 
> I am reading section 6.5.4, there is one paragraph said:
> 
> > The fraction of cells visited by PWQ is similar to that of SEQ. In addition, PWQ’s solution time is greater than that of PART, even for equal visit fractions. The reason for this is shown in Figure 6.28, which has a red circle on
> > Figure 6.29: Effect of Compiler Optimization (-O3)
> > each cell with more than two neighbors. Each such cell can result in contention in PWQ, because one thread can enter but two threads can exit, which hurts performance,
> 
> I don't know why there is competition only when a cell has more than two neighbors?

If there are only two neighbors, PWQ won't create another thread, so
there will not be contention.  In that case, PWQ will have the same
thread exit the cell that entered it.  Only when there is more than two
neighbors will PWQ create additional threads, which can then contend
with the original thread and with each other.

> And as the subject said, what does "one thread can enter but two threads can exit” mean?

Let's start in the upper left-hand corner of Figure 6.28.  The first
cell has only one neighbor, namely the one beneath it.  So PWQ just
advances to that cell without contention.  But the next cell down has
two exits, so PWQ will create an additional thread, one heading right
and the other heading down.  Now contention is possible.

> After checking the code(maze_fg.c), Doesn’t every cell in the maze can result in contention?

You mean (for example) from a thread on one side of a wall suffering
memory contention with a thread on the other side of that same wall?

If so, yes, but that can only happen if some earlier cell had more than
two exits.  Suppose that we had a boring maze that had no cells with
more than two exits, so that only one path was possible.  In that case,
there would only be one thread throughout, so no contention.

Or am I missing your point?

							Thanx, Paul
