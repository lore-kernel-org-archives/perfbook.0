Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236592AbhCCCFg (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 2 Mar 2021 21:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614737043;
        bh=NZtRQ34ZRnmQFaIvXam0Liq9oDcKWL1hV+Zk9D2Fpiw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=B/qOQ8kFcBmn76pAZJiEPFK4/Y7v8cYK06HuM24Q2wzOi6LkmRPVrkbfNEVIqGkwL
         u6pULssXkBZn4rjApDzwfaUqQZnFHewh3vPqK9qDUCkD4QiUXuEGOhLfUGr7KssSEE
         H6IXNgYsT7RxXoF/7dljKoa4ZCGwn6t3xlEnjXgb3SIATrcor2vKEEa9VYqOzGmfTy
         vZccdkw1pKc6+hzjgJQUhGmQdFwehpe52DAIsjzNlg/usPa4npa9r6q7bdEP5oSZWN
         FGfNDDW+FXjXzmJVskcWWMWvkJCgplXwbKx/j2/ZeKjO0C5AcclBlFRyB/Gps/Ctez
         8g5CSfVSX6I9A==
Date: Tue, 2 Mar 2021 18:04:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Bibliography and misc updates, take two
Message-ID: <20210303020403.GU2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <c8254363-b8c0-3e45-1bf0-e41be7af64d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8254363-b8c0-3e45-1bf0-e41be7af64d6@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 02, 2021 at 11:50:36PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This pull request consists of followup url updates in bibliography
> and elsewhere.
> 
> This time around, I managed to explain non-obvious changes in the
> commit logs.
> Most changes just substitute "https:" for "http:" in URLs.
> Other changes are mentioned in each commit log.
> 
> I'm certain there still remain some breakages I'm missing.  Papers with
> DOIs are safe, but "unpublished" entries need periodic health checks.
> 
>         Thanks, Akira

Pulled and pushed, thank you very much!  And yes, nothing quite like
having hundreds of URLs to drive home how dynamic the web can be.  :-/

							Thanx, Paul

> ---
> The following changes since commit 163fc536dc0fe6a4d9aa8c61b030ba94ea401d1c:
> 
>   easy: Updates and wordsmithing (2021-03-01 18:09:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.02a
> 
> for you to fetch changes up to 7c2c33a896ede1bb9ce476b8a67451c3fb364203:
> 
>   treewide: url related updates, take two (2021-03-02 23:23:44 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (4):
>       whymb: Fix potential extra blank line within 'sequence' list
>       alphapf.bst: Use 'https:' as base of doi, eprint, and pubmed URLs
>       bib: url updates take two
>       treewide: url related updates, take two
> 
>  alphapf.bst                          |   6 +-
>  appendix/styleguide/styleguide.tex   |   2 +-
>  appendix/whymb/whymemorybarriers.tex |   2 +-
>  bib/OSS.bib                          |  12 +--
>  bib/RCU.bib                          | 169 ++++++++++++++++++-----------------
>  bib/TM.bib                           |  34 ++++---
>  bib/WFS.bib                          |   2 +-
>  bib/hw.bib                           |  28 +++---
>  bib/maze.bib                         |   5 +-
>  bib/os.bib                           |  28 +++---
>  bib/parallelsys.bib                  |  23 +++--
>  bib/realtime.bib                     |  46 +++++-----
>  bib/refs.bib                         |   1 -
>  bib/swtools.bib                      |  44 ++++-----
>  bib/syncrefs.bib                     |  47 +++++-----
>  datastruct/datastruct.tex            |   2 +-
>  formal/formal.tex                    |   2 +-
>  formal/ppcmem.tex                    |   6 +-
>  formal/spinhint.tex                  |   4 +-
>  howto/howto.tex                      |   6 +-
>  intro/intro.tex                      |   2 +-
>  legal.tex                            |   4 +-
>  locking/locking.tex                  |   2 +-
>  23 files changed, 246 insertions(+), 231 deletions(-)
