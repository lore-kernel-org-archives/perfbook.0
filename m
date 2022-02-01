Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:45422 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbiBAR5H (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 1 Feb 2022 12:57:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BA846134C
        for <perfbook@vger.kernel.org>; Tue,  1 Feb 2022 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643738224;
        bh=hLHKCM4vz6y83GYap6PWhe34Qt8Nkl4vFyB5IsvJG7o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=blv7hNcTM4DW8AEYspXJvnQSxmQ6XALaOa87I+3a7GbQX8d6tQg73moU3ZqBzAzrY
         ok50E9WBoTU2mkXhZFr6JNFx9z59s8pQUlBRQ2V+V9yvob8KmrO1BW/A3YAV4ddu+l
         xhu9jKj6nhT5tXRDZlJOZ9+MN1oIlaWpd5GOfsuyueKZXJj3nhyQ3jCLBw1FHrqaTE
         LUlAlLUhQ/vl/Fbt2PuRqC3OAsfViNwLG3xZDJy2RNiwwVlWFb2dJMulezQvwdRXpP
         AOBoAparGORss2gzRKZ9A2uk7jeo6N5pteSuARMspAC+LawFiTweRZm73GmPLKMffl
         y2uZ9l93afmrQ==
Date: Tue, 1 Feb 2022 09:57:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] count: Fix typos
Message-ID: <20220201175703.GY4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220129221815.89451-1-johann@jklaehn.de>
 <20220131015504.GU4285@paulmck-ThinkPad-P17-Gen-1>
 <87o83r3ej5.fsf@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o83r3ej5.fsf@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Mon, Jan 31, 2022 at 08:12:46PM +0100, Johann Klähn wrote:
> On Sun, Jan 30, 2022 at 17:55 -0800, Paul E. McKenney wrote:
> > Queued and pushed, thank you!  I did take the liberty of changing your
> > added "can" to a "nevertheless".  Does that work for you?
> 
> Sure, in that case maybe also remove the second “be”?
> | Atomic increment might be completely acceptable for a two-CPU
> | system, but nevertheless completely inadequate for an eight-CPU system.

Good point in that the sentence is still a bit awkward.  So what I have
done is to add a LaTeX comment that will remind me to think harder
about it.  If I don't get a good replacement by (say) March, please
remind me about it.

							Thanx, Paul
