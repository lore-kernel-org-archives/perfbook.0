Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:56638 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiAHFHG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 8 Jan 2022 00:07:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C54CBB82833
        for <perfbook@vger.kernel.org>; Sat,  8 Jan 2022 05:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641618424;
        bh=3zmxXgwxp6ryQo9zvGw7e6CwvnWSD9BFsjiuX2zZq+w=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CeCR2mCGyH/Yfc3/HfnYPOIA3rPOrqsDH78evy/w4YIzeBgPwBT4uNAji09YW2htC
         b0zxVYMno26KObfEqZ1vYAhC9aWd6ahpJfm+u/7lkB9sax+DpNynQJnXqZ+AvN9g4F
         jEdEPM2ff3Uz1C5FWqt8GTdK7wYj3rvxS/NySTRSi66zlXF9YXz2lrqdcsJT6MFKmZ
         ou2fOw/z3wQxCYUZE3WkeG35IBgSOijNTg6bj4i2myjSAHw+KUsr1t8GaZmUsgxovr
         Ey4UEjmJ51yBQo3kFtcLSpFMZVmNYzFtnaK0fB4Mlbz1WtBBoCipvHripQHvPQGNB3
         qrXV5bWBdsiKw==
Date: Fri, 7 Jan 2022 21:07:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH RESEND -perfbook 00/10] Index and acronym updates
Message-ID: <20220108050704.GA909013@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
 <20220106161945.GK4202@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106161945.GK4202@paulmck-ThinkPad-P17-Gen-1>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 06, 2022 at 08:19:45AM -0800, Paul E. McKenney wrote:
> On Thu, Jan 06, 2022 at 04:29:25PM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > This is another round of *never-ending* indexing updates.
> 
> Maintaining indexes is non-trivial, no two ways about it!
> 
> So special thanks for this series!
> 
> At some point, for the index entries with lots of references, it may
> be necesary to flag the most important references.  I sometimes see
> such entries italicized or marked with "ff", though I freely confess
> that I have no idea what the rationale for "ff" might be.

And I did find this.  The "ff" stands for "folios following", where
"folio" is used in the sense of "page".  So "368 ff" means "page 368
and some number of subsequent pages."

I have spent most of my life fooled into thinking that "ff" indicated
the most significant page for a given index item.  But there is some
connection, at least assuming that a longer discussion of a given term
is a more significant discussion of that term.  ;-)

							Thanx, Paul
