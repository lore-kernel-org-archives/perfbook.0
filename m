Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgL3QO1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 30 Dec 2020 11:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344826;
        bh=qAWpAf6NSMETiw9GiwJ9EfZ1ZM5KIt3FY0ZYqO2S4lA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oV45vmQWCPj/M5gzqbUEyQlFZLr6CBgXtR9f4J6wG1XApur/qwou+gP2aceFDCC5G
         rnNCpAuvgx44e7+QrK0vUw4aKQXG7499xOYJ192SeOjr5XDaIkTDkrpIzLgH0tX5/s
         3sfG7llKdwRun+aE+l1W++yzo6yL1bCoYvJfDrFzWCUnQOYolinyqgH0PHAJLxxieY
         3kmdOOet9zSRJmy5q298j6OGkNbOiIm6akgsT9iujuCb8WzLS4CtlvEZ7cGCIsk7xs
         vYMNzV6V6P0X1k9mhzLtalA3j2f5qyZ/AcqWad5Jb/zHYlQharJVzuMBhTV5NTLLPM
         wVwrLhq1FOiNg==
Date: Wed, 30 Dec 2020 08:13:46 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Message-ID: <20201230161346.GM2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
> > Hello!
> > 
> > Release Candidate 1 of the Second Edition is now available, and I have
> > started a prototype blog entry: https://paulmck.livejournal.com/59935.html
> > Please let me know of any omissions or errors in this blog entry.
> 
> Wouldn't it be worth while mentioning the availability of the "nq" build
> targets?

Good point!  How about like this?

	Those who find Quick Quizzes distracting will be happy to learn
	that "make nq" relegates both the quizzes and their answers to
	the end of each chapter, similiar to common practice in textbooks.

Maybe I should also show what "make help" and "make help-full" print out.

							Thanx, Paul

>         Thanks, Akira
> 
> PS:
> 
> My experiment on index annotations is progressing but slowly.
> Besides the hierarchical indexing, I'm attempting to make use of
> the "glossaries" or the "glossaries-extra" package to manage indexing
> of acronyms.
> Once it becomes stable enough, I'll submit an RFC pull request.
> That would be after the release of Second Edition.  
> 
> >                                                                    I expect
> > to post it to my social media accounts in a few days.
> > 
> > And thank you all for your interest in and contributions to perfbook!
> > 
> > 							Thanx, Paul
> > 
