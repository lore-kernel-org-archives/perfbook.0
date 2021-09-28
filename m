Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230109AbhI1S6i (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 28 Sep 2021 14:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632855418;
        bh=wXQAIXndXQ2MoDqwbv3EXUqQATDv9ysJd1UgZWtaG4s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=q68MNlcgGO9DTY/zjHBY2ErPmqU/sqYK0JH8vKdM29zZRDF+1WlmXGtGAsHGfvqyW
         Ur+4bB6JFXnozqiJVJWDi5wxkyU/SxZfPxpXLbaeT8bKL67A+RqeI5wlwOYxc9QFo1
         d5Ayn2jA1vhwjC+bC5Njos4Kb0xlcN/f4DxH48Yia4NJaE+8KW16HyrjXXIVtmTVAG
         v/+j2MUd3CrPZFOxUwHx/nAY0ssnuMgE0ZSPAp5K+5iNngEZVDfgJ7KUM5OVLeGwed
         PFtwfZwfZ0wZoXbMvTQ16e2DttW1CDYGDMCEJ35gMf6SawnmFmK7Jnmst8Syo5kpSI
         Q5XvfDBlZUz4Q==
Date: Tue, 28 Sep 2021 11:56:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Make RCUspacetime.svg compatible with
 Inkscape 1.0 and later
Message-ID: <20210928185658.GE880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
 <d28da94e-3e54-e264-5b81-01c1636dbb9f@gmail.com>
 <20210923144150.GF880162@paulmck-ThinkPad-P17-Gen-1>
 <957e369c-9fb1-f615-9b62-c1245d227548@gmail.com>
 <d7fb71ca-9f7b-27a1-0c32-30a94962ba6b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7fb71ca-9f7b-27a1-0c32-30a94962ba6b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 28, 2021 at 11:23:26PM +0900, Akira Yokosawa wrote:
> On Fri, 24 Sep 2021 09:25:31 +0900, Akira Yokosawa wrote:
> > 
> > PS:
> > 
> > Upcoming ghostscript 9.55.0 (now in rc1 phase) will break a2ping again!
> > I'm preparing a patch set to abandon a2ping for good.
> 
> Good news!
> 
> Ghostscript 9.55.0 was released on September 27:
> 
>     https://www.ghostscript.com/doc/9.55.0/News.htm
> 
> , and it _works_ with a2ping!
> Looks like a regression around bounding-box in Ghostscript has been
> fixed since rc1.
> 
> Anyway, I'll send a patch series to add an alternative set of
> .eps --> .pdf conversion rules after some testing on my side.
> It works even with the problematic 9.55.0rc1.

Sounds very good!

> Who knows what could happen when 9.56.0 comes along...

;-)

Now that Linux Plumbers Conference is done, I should have more time for
perfbook.  I usually expect that maybe a third or a half of my submissions
will be accepted, but this time they took all six, so the last couple
of weeks were a bit busy.  My presentations were well received, though,
so there is that!  ;-)

							Thanx, Paul
