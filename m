Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727509AbgABEAu (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 1 Jan 2020 23:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577937650;
        bh=CVghYOyscl6sKgsyUgv16ePhGz8fKTo/8LhkIkymNTc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SSdyL6RXsX8LDW38g6d1ylVlWDXr6FP4Uv+c4DcagFmTCf4HrvqVZvEDLo4opB4Ue
         SXoIZgQlQcycXTWAu7Mr6HXUBNDV866ylCI//GkPi4K5CvLMv4SY4mES0UBOSVZjrb
         UU6kYGVlVUMh/608iGJSbzS4fzBMTV5lfsXXR3ho=
Date: Wed, 1 Jan 2020 20:00:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] Improve autodate.sh
Message-ID: <20200102040050.GA17712@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
 <20191231000627.GS13449@paulmck-ThinkPad-P72>
 <21f02b44-a925-f082-4cf9-af2a42786050@gmail.com>
 <20200101030611.GX13449@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101030611.GX13449@paulmck-ThinkPad-P72>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 31, 2019 at 07:06:11PM -0800, Paul E. McKenney wrote:
> On Wed, Jan 01, 2020 at 08:36:24AM +0900, Akira Yokosawa wrote:
> > On Mon, 30 Dec 2019 16:06:27 -0800, Paul E. McKenney wrote:

[ . . . ]

> > As mentioned above, I'm OK with keeping the current behavior.
> > Adding some namespaces to .gitignore might be a better approach,
> > but it is not urgent at all.
> 
> As noted earlier, this sounds good to me!  One approach would be to
> add the experimental directory and a README within it, with the README
> describing the purpose.  Then a .gitignore in that same directory could
> ignore all but the README.  But maybe you have a better idea.

Another possibility would be for your tests to direct output somewhere
outside of the perfbook source tree, if that would work reasonably.

							Thanx, Paul
