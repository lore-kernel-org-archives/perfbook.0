Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjFIWyf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 9 Jun 2023 18:54:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB02199D
        for <perfbook@vger.kernel.org>; Fri,  9 Jun 2023 15:54:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1946B6432E
        for <perfbook@vger.kernel.org>; Fri,  9 Jun 2023 22:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686351273;
        bh=tq4ZdT/jH7dU+7tICYjMwHAAhl7qPQ1j2oy0US3HjFc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=r2GrTk7qM7GBW94bHuq4FtbmSlHylXHVoJJelgnVxzqI2Og9Iwqumm3g8Ze/86WgW
         BPIHEbxwh4ZwG5hTqiXbu8Taw5OjfS8hP/swodJcCRIxdK4kd1y+I3x1tYRRo5uMqp
         nf4AiFzunx+QXXwJbWvTfZCPC52M8HWnMhBliih5L14Wnog9L0posibMsCEansgkpk
         AvnnCYHnjrDWCEPJVXe0vc0HIQQRUDmJ6poWDnF++PRjeNmsv4AGYMapPebymX9zpG
         dFwBiUDgudUSgA0ldkawdAzGZkQ1MZCk375efwqeJCor9RnB9467lopzVv3KvEe1/x
         l2m5KEKK6H5kg==
Date: Fri, 9 Jun 2023 15:54:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question about commit 94f01e467566("together/applyrcu: Note
 possibility of lost counts")
Message-ID: <246323b4-4f1a-4631-923a-bd45a90b6b5b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <68A3E1AD-093D-4EA7-930D-0BED8BF42A3F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68A3E1AD-093D-4EA7-930D-0BED8BF42A3F@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 05, 2023 at 11:29:22PM +0800, Alan Huang wrote:
> Hi Paul,
> 
> I noticed this commit 94f01e467566("together/applyrcu: Note possibility of lost counts”) said that:
> 
> 	count_unregister_thread()  can result in the outgoing thread's counts being lost. 
>         This can happen when read_count() is invoked between lines 66 and 68.
> 
> However, line 66 NULLs the local data, and it has not been published, I don’t think 
> count_unregister_thread()  can result in the outgoing thread's counts being lost.
> 
> Or, am I missing something?

You are missing nothing.

Some days it does not pay to touch the keyboard, and apparently last
week had at least one of those days.  :-/

							Thanx, Paul
