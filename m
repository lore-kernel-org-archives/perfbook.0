Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:60131 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751451AbbBJXVr (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 10 Feb 2015
 18:21:47 -0500
Received: from /spool/local	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 10 Feb
 2015 16:21:46 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 83AF01FF002D	for <perfbook@vger.kernel.org>; Tue, 10
 Feb 2015 16:12:55 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t1ANLk4x28311572	for <perfbook@vger.kernel.org>; Tue, 10 Feb 2015 16:21:46
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t1ANLhNL016415	for <perfbook@vger.kernel.org>; Tue, 10 Feb 2015 16:21:43
 -0700
Date: Tue, 10 Feb 2015 15:21:41 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: rcu_read_unlock() in the nestable rcu based on free-running
 counter
Message-ID: <20150210232141.GC4166@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20150210014240.GA6334@danjae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150210014240.GA6334@danjae>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Namhyung Kim <namhyung@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 10, 2015 at 10:42:40AM +0900, Namhyung Kim wrote:
> Hi,
> 
> It says "Interestingly enough, the implementation of rcu_read_unlock()
> is identical to that shown in Section 'RCU based on free-running
> counter'".  However it seems not.. ;-)

Indeed!  How about the following?  (And good catch, by the way!)

							Thanx, Paul

------------------------------------------------------------------------

Interestingly enough, despite their rcu_read_lock() differences, the
implementation of rcu_read_unlock() is broadly similar to that shown in
Section 9.3.5.7.

