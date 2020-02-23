Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgBWPdS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 23 Feb 2020 10:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582471997;
        bh=FuRfYEr2zi7R5aIoFZ4Lv+zBAjIhbEPBcj4VZJSf4Ys=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=f4gQoPe4A43Qt/A7MwgnpSIP1HqKQ3/MRCdjbM9bkFfDrZdubojX2h8Lvjbg2y/vm
         HMT8dg8oc7w1ARqqlrjaK5b8KfTqT8ylQw/NyS+umHwXubTUd3F1B1rqFef6QOLD7e
         BiAvslCiOBE0D4/MdMoyIkqKN4tc5ddrXHW33OjM=
Date: Sun, 23 Feb 2020 07:33:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Towards second edition
Message-ID: <20200223153317.GA23764@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: akiyks@gmail.com
Cc: perfbook@vger.kernel.org

Hello!

I finally found and fixed the rcu_barrier() bug [1], so I should again
be able to devote some big-system test time to redoing performance
results in perfbook.  Once that is done, I expect that it is time for
the second edition.

I might also convert the blank page hiding the solution to the Dining
Philosophers Problem to a quick quiz, but I consider this optional.

Are there any other changes that are needed? [2]

							Thanx, Paul


[1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
    offline no-CBs CPUs") in -rcu, in case anyone is curious.

[2] Here is a list of some things that I believe can follow the second
    edition:

	Expand lock-free algorithm discussion to include LIFO push,
	illustrating the infamous pointer-zap issue.  (See ISO SC22
	WG21 P1726R3, which should appear in a couple of weeks, for
	more details.)

	Add text describing the Issaquah Challenge.

	Add text describing skiplists, one of the more concurrency
	friendly data structures.

	Add text describing data-race detectors such as KCSAN.  (This needs
	to wait for more Linux-kernel experience.)

	Additional material from todo.txt.  ;-)
