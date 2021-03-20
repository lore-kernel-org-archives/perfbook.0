Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhCTAaZ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 19 Mar 2021 20:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616200224;
        bh=V85jbFsdUTOwiPBoC0n894BsFIF3cuqtgYMYtMoX+Cw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UVkRV/a5Z6u+qTDqQeb26SaD96yFvnU7cljanIgjqxH4DdWK/dPPY8bCIjnHS5zuP
         Ug+73JU6Yl/HB8HZQrbkypZuko3fj6dlWVXwZ73tSQ0giiag1DaAkmE+Z3GesYlLL0
         5HGmayRrnf37VqUIUXbtXHebfJVB0E2mtBYLAaHZFd2pfwAHCV8Ch+XUvLaNyhmbmj
         OzbGNsCU0wm5WjXBPF++1Hgs5wcoDoMA5UjUt/LRChiaf7IfVRSIHJu6sGhH/hugn9
         cM5+fJ00klFTm3KLpT3+ofbk75Hw2oLyPHOI7xjFhyDiO7gv2VbGyfjDNVXWDlUcbq
         tRTWgYD5rwf4Q==
Date: Fri, 19 Mar 2021 17:30:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Minor tweaks and styleguide update for
 Edition 2, take 4
Message-ID: <20210320003024.GX2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <1bab2519-02be-a38c-0d20-ac40567c084e@gmail.com>
 <095ffc25-da49-7742-b7b9-8772ff1899e9@gmail.com>
 <20210318175835.GG2696@paulmck-ThinkPad-P72>
 <cc6345e3-3c38-3b11-6184-e816ecb84073@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc6345e3-3c38-3b11-6184-e816ecb84073@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 20, 2021 at 09:07:24AM +0900, Akira Yokosawa wrote:
> On Thu, 18 Mar 2021 10:58:35 -0700, Paul E. McKenney wrote:
> > On Thu, Mar 18, 2021 at 10:46:18PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I added a section on full stop spacing example in styleguide.
> >> There were a couple of typo fixes in memorder.
> >>
> >> This is relative to the earlier pull request of take 3.
> >>
> >> Typo fixes are intentionally divided as individual commits.
> > 
> > I pulled in the whole stack, thank you!  We overlapped on only one typo.  ;-)
> > 
> > I updated the style guide to explicitly call out which full-stop
> > hints work.
> 
> Thanks!
> 
> >             You may wish to update to pick a preferred method for the
> > "Mr. Smith" example.  
> 
> "Mr Smith" would be an option in British English these days.  ;-)

Now that you mention it, I believe that I have seen that form!

> Getting back to the point, as for "Mr.", "Mr.~Smith" should work almost
> always.
> Other abbreviations such as "etc.", "et al." and so on might not
> always need "~".
> When a line break is acceptable, you can use either "et al.\ " or
> "et al.\@ ".
> Which one to choose is up to your preference.
> Who prefers symmetry might choose ".\@", I guess.

I am fine with ".\@", though ".\ " is less typing.  But either way
is fine.

> >                       I expect that it will take quite some time for me
> > to form the habit of typing either of the three, but maybe checking for
> > this can be scripted?
> 
> As long as the rule mentioned at the bottom of Appendix D.1,
> yes, I think it is possible to detect full stops not properly
> annotated.
> 
> In the middle of a source line, "xxx. yyy" is bad.
> "xxx.~yyy", "xxx.\ yyy", or "xxx.\@ yyy", is good.
> "xxx\@. yyy" is against the rule.
> 
> At the end of a source line, "xxx YYY." is bad. 
> It needs to be "xxx YYY\@."
> 
> So surely these checks can be scripted.
> 
> May be sometime after the release of Second Edition.

Definitely not at all urgent, but just as definitely nice to have
at some point.

> By the way, I think most rough edges have been taken
> care of, and I'm expecting the release this weekend.
> I'll send a last minute pull request if I catch something.

Sounds good!  If I don't hear otherwise from you, I will post the
Second Edition on Sunday, Pacific Time.

						Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akra
> >>
> >> --------
> >> The following changes since commit 194bd0a454fc3ca2e6d50c39c248e35fd24ff61a:
> >>
> >>   datastruct: Remove redundant line (2021-03-18 10:01:20 +0900)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.18d
> >>
> >> for you to fetch changes up to a70d76c76d8e3b4338f813da9ddfb8fa880a653c:
> >>
> >>   memorder: Fix usage of \pageref{} (2021-03-18 22:14:28 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (6):
> >>       styleguide: Use \Cref{} at start of sentence
> >>       sytleguide: Add a section on full stop
> >>       memorder: Fix typo
> >>       memorder: Fix typo
> >>       memorder: Fix typo
> >>       memorder: Fix usage of \pageref{}
> >>
> >>  appendix/styleguide/styleguide.tex | 83 ++++++++++++++++++++++++++++++++------
> >>  memorder/memorder.tex              |  8 ++--
> >>  2 files changed, 75 insertions(+), 16 deletions(-)
> >>
