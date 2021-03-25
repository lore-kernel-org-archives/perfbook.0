Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhCYDuc (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 24 Mar 2021 23:50:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54EF861A0A
        for <perfbook@vger.kernel.org>; Thu, 25 Mar 2021 03:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616644232;
        bh=LZ0zKITBC8j9+h4WP9Xco/nhSluO3A5bCxeqcy1+j6I=;
        h=Date:From:To:Subject:Reply-To:References:In-Reply-To:From;
        b=pi9SrEn+0KrpcDBiMeeUAQ6gCHwD3E2gC4yyzRbZxkjZcl0f7i04jKC7jVatEPvXo
         lbBdIDI9sVad/TQ+QJ/e+d62CBcPdpkCts3Y78gkdvm/awjM8vsEGUyIl0Naf8NISD
         iTx3317n6Mz7PN+6TFqqIOp+dvdxzZ/EeOhsCEWOHoYCRqkOSOAF29YfZFgfBqfO3V
         +O+UvIu08PLdOv3YJLx3EXgrYDBruuJBtzRl49xeqhXRcEEGJJMm8GpFDkuYMuyiFo
         vOtKJN7BLWN3a9+LTOQD//TC+1W0JlPDeldZLZbCWdvg0aIQ4S92ZyY5YkF0n6k7ZE
         a0l4Zyou8RsWw==
Date: Wed, 24 Mar 2021 20:50:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Second edition coming up soon!
Message-ID: <20210325035032.GA13394@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210308164105.GA2210@paulmck-ThinkPad-P72>
 <20210315153256.GA9958@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315153256.GA9958@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On Mon, Mar 15, 2021 at 08:32:56AM -0700, Paul E. McKenney wrote:
> On Mon, Mar 08, 2021 at 08:41:05AM -0800, Paul E. McKenney wrote:
> > Hello!
> > 
> > Had I been living right, I would have been announcing the Second Edition's
> > release candidates on this list.  Hopefully better late than never...
> > 
> > The Second Edition Release Candidate 10 is available here:
> > 
> > https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
> > 
> > There are only a few appendices to go, as I am not going to do an update
> > of Appendix B or C.  So it is likely that the Second Edition will be
> > released this coming weekend (of March 14).
> > 
> > So if you see anything needing a bit of wordsmithing, please let me know!
> 
> And there were too many typos remaining, so I posted Second Edition
> Release Candidate 11.  Hopefully next week...

And it is out!  Thank you all for all your contributions to this effort!!!

What is next?  Why, the third edition, of course!  ;-)

							Thanx, Paul
