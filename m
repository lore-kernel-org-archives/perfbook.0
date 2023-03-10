Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233997AbjCJPtW (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 10 Mar 2023 10:49:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D21E12DDCA
        for <perfbook@vger.kernel.org>; Fri, 10 Mar 2023 07:39:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29C74B822DE
        for <perfbook@vger.kernel.org>; Fri, 10 Mar 2023 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678462779;
        bh=uXjhnr5qoQ4XoF0ykSTIUGUUAC0dO3iIZ/AorYLKMDM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qujSXy/V/U90WMplKlAFSH3nMRoKmEP9a9qW5aG+0UKmXeejeDiyILysxQeZ3wTLf
         TNv1MCxOLtqwCUrvLW6GzycbMFoAZ2RnVb2/pIfLPA/cSlDeI9w5g/AieRR/rxaE7o
         azMoC6pZTAgmcIZzsajMkXvhsMmx1/2raP4KYy7ro+ummnKWkvCQknwW5/6FubntuL
         q3lTUKfMLjiqxqzaL9hLzDRLOWCtyqzl+aZjQpJeoeCJkL7JBSnbyk0wHPeankLrfa
         XNx42nTOW1i/X6gbolgEgqP692Joxf014FKQ2vz2kgKttuLcjwYbRsMFa/jPDU4zQQ
         ip9EjjHq54j0Q==
Date: Fri, 10 Mar 2023 07:39:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Improve portability of build scripts
Message-ID: <20fd9bd4-2081-4ee7-87da-5a827997dfbf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <21e1a397-c9aa-2100-527c-e29191a918c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21e1a397-c9aa-2100-527c-e29191a918c2@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 10, 2023 at 11:06:56PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> As I mentioned a month ago or so, I've been working on improving
> portability of building perfbook.
> 
> By portability, I did actual tests mostly under FreeBSD and light weight
> alpine container images, not under macOS.
> So I don't know if this enables native build for macOS, but here we are.
> 
> I don't expect any regression for existing build environments.
> (Famous last words!)
> 
>         Thanks, Akira
> --

Seems to work, so I queued and pushed it.

On a separate topic, Ubuntu 22.04 seems to require "apt install fuse"
in addition to the list currently shown, but that might be an artifact
of my installation.  Without this, inkscape refuses to create PDFs.
(I am somewhat surprised that inkscape would require this.)

							Thanx, Paul

> The following changes since commit 7876fdfc56dd679b41f68ca5507f1637de35bbb6:
> 
>   defer/rcu: Include Butler Lampson RCU assessment (2023-02-28 13:30:47 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-portable-build
> 
> for you to fetch changes up to f7592d2c93182397b032413d68fa139baae262fa:
> 
>   FAQ-BUILD.txt: Remove /bin/bash from list of requirements (2023-03-10 20:15:12 +0900)
> 
> ----------------------------------------------------------------
> Improve portability of build scripts
> 
> Makefile and build scripts have assumed utility commands found
> on GNU/Linux systems.
> Past attempts to build perfbook under non-GNU/Linux hosts such as
> macOS and FreeBSD failed due to differences in directory-tree
> conventions and lack of command features specific to GNU variants.
> 
> Here is a list of non-portable conventions and features assumed
> in the past:
> 
>     - /usr/bin/perl in shebang
>     - date: syntax of options for format conversion
>     - sed: -e in front of regex can be omitted
>     - sed: "{" in to-be-replaced regex where repeat count is not
>       expected is interpreted as literal "{"
>     - sed: multi-line edit
>     - grep: -z option
> 
> * Changes made for better portability:
> 
>     - #!/usr/bin/perl -> #!/usr/bin/env perl
>     - sed: always use -e in front of regex
>     - sed: escape literal "{" in to-be-replaced regexs
> 
> * Still need capable implementation of commands:
> 
>     - date: format conversion
> 	(needed in autodate.sh)
> 	either GNU or BSD flavor works, busybox date can't do such conversion
>     - sed: multi-line edit
> 	(needed in extractqqz.sh)
> 	    - FreeBSD's native sed lacks this feature
>     - grep: -z option
> 	(for checking \cref{}{} which should be \crefrange{}{})
> 	    - busybox grep on alpine lacks this config
> 	This check is moved from Makefile to cleverefcheck.sh and
> 	skipped if an incapable grep is detected.
> 
>   Necessary features of date and sed are now checked in the very beginning
>   of make runs. Manually running "make precheck" can give a verbose
>   result of the check.
> 
>   For those who have a full featured command in a different name,
>   make/environment variables SED, DATE, or GREP can be used to specify
>   an alternative name or full path.
> 
> * Package/command removed from requirements:
> 
>     - fig2ps
>     - which
>     - bash
> 
> ** fig2ps
> 
>   On most Linux and other UNIX-like distros, fig2ps is not provided as
>   a distro package.
> 
>   fig2ps would be needed if LaTeX special strings (such as math expressions)
>   were used in FIG files. But it is not the case. Instead, fig2dev is
>   good enough for .fig --> .eps conversions.
> 
>   fig2dev should be available for most distros as a package named
>   "fig2dev" or "transfig".
> 
> ** which
> 
>   It has become usual to be greeted with the
> 
>      "which: command not found"
> 
>   message on minimal installation of Linux distros, for example,
>   RHEL/CentOS/Fedora and Arch.
>   Instead, "command -v" is the portable way for testing command
>   existence since POSIX 2008/2013.
> 
> ** /bin/bash
> 
>   It turns out that existing build scripts work with variety of /bin/sh
>   choices including dash, bash, zsh, and even busybox sh.
>   The setting of "SHELL = /bin/bash" in Makefile is now dropped.
> 
> Tested under FreeBSD 13.1 and alpine.
> 
> ----------------------------------------------------------------
> Akira Yokosawa (15):
>       Use /usr/bin/env in shebang of perl scripts
>       extractqqz.sh: Allow alternative command name for 'sed'
>       Makefile: Use multiple '-e' flags for non-GNU sed compatibility
>       autodate.sh: Add code for BSD-flavor date command
>       autodate.sh: Allow alternative command name for 'date'
>       Makefile: Use portable egrep pattern (enclose '{' in '[]')
>       Makefile: Move CREFPAIR check into cleverefcheck.sh
>       FAQ-BUILD.txt: Add Q&A on building under non-GNU/Linux systems
>       Use fig2dev as fallback to fig2eps
>       Add precheck.sh
>       FAQ-BUILD: Mention precheck
>       Stop using 'which' command in bulid scripts
>       FAQ-BUILD.txt: Remove fig2ps from necessary packages
>       Makefile: Remove 'SHELL = /bin/bash'
>       FAQ-BUILD.txt: Remove /bin/bash from list of requirements
> 
>  FAQ-BUILD.txt              | 53 +++++++++++++++++++++++--
>  Makefile                   | 54 ++++++++++++-------------
>  a2ping-rule.mk             |  2 +-
>  epstopdf-rule.mk           |  2 +-
>  utilities/autodate.sh      | 24 +++++++++---
>  utilities/checkfcv.pl      |  2 +-
>  utilities/cleverefcheck.pl |  2 +-
>  utilities/cleverefcheck.sh | 23 +++++++++++
>  utilities/divideqqz.pl     |  2 +-
>  utilities/extpagegroup.pl  |  2 +-
>  utilities/extractqqz.sh    | 17 ++++----
>  utilities/fcvextract.pl    |  2 +-
>  utilities/gen_snippet_d.pl |  2 +-
>  utilities/mpostcheck.sh    |  4 +-
>  utilities/precheck.sh      | 98 ++++++++++++++++++++++++++++++++++++++++++++++
>  utilities/qqzreorder.pl    |  2 +-
>  utilities/reorder_ltms.pl  |  2 +-
>  utilities/verbboxcheck.pl  |  2 +-
>  18 files changed, 238 insertions(+), 57 deletions(-)
>  create mode 100755 utilities/precheck.sh
