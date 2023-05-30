Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjE3AgM (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 May 2023 20:36:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50337D9
        for <perfbook@vger.kernel.org>; Mon, 29 May 2023 17:36:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7A3A62710
        for <perfbook@vger.kernel.org>; Tue, 30 May 2023 00:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685406970;
        bh=Mks8DJzSBKSc1CAuEKiabiEFnUpOiUlNzB9yMSgcs+s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=s/Gds9lgdRzz49KESO43y8wgWfpo4A0Te8OvEXNwYjO5IDRDlZx0Rh1L4+faP+j0k
         QcbzSrGLTfqLqOh3ozS+HeIwfPRXhZSk2kUP8HFaME3CFsJ1vFVlR95vswzW9MUBJN
         TCnMjc/FU/2mqgyfM+BFqhv3ieYlzhu6Ici89+bxO/hSSOx7J23UryKLZbxGeeQwML
         Bq10TLtfbv4h7phkgczsbf5b/CVxotPyJT+91k7UV2rCk7/3u8OIkfJ+cl5iLXR5Tl
         slSWZGuv7PfEN0JBvH5dOgwLUsNE6OiLV+uIPALGHEycM7/RszxA1T8zG0KS1LgbEn
         Tyz5K/PR/dvrg==
Date: Mon, 29 May 2023 17:36:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question: In what circumstances would the enqueuer fail?
Message-ID: <451e4440-b315-451b-a0ec-e211b219b724@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <BC1D7582-8D92-411D-8E61-68252413A1BA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BC1D7582-8D92-411D-8E61-68252413A1BA@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 30, 2023 at 12:48:33AM +0800, Alan Huang wrote:
> Hi,
> 
> I’m reading 14.2.1.3 Half-NBS Queue, there is one sentence says:
> 
> 	The enqueuer might have failed between lines 9 and 10 of the listing, so that the element in question is only partially enqueued.
> 
> My question is: In what circumstances would the enqueuer fail between lines 9 and 10 ?

The following circumstances would do it:

o	Someone kills the thread at that point.

o	The CPU that the thread is running on takes an interrupt,
	but there is an infinite-loop bug in the interrupt handler,
	so that the thread's execution is never resumed.

o	The CPU that the thread is running on fail-stops, again
	preventing that thread from resuming.  (This is rare, but
	does occasionally happen, especially on old or thermally
	abused hardware.)

So nothing normal, if that is what you are asking.  ;-)

							Thanx, Paul
