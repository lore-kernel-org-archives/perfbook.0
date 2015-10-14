Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:34407 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752201AbbJNAxP (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 13 Oct 2015
 20:53:15 -0400
Received: from localhost	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 13 Oct
 2015 18:53:15 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 1DC543E4003E	for <perfbook@vger.kernel.org>; Tue, 13
 Oct 2015 18:53:13 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9E0nw1e10093008	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 17:49:58
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9E0rCdp030041	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 18:53:12
 -0600
Date: Tue, 13 Oct 2015 17:53:20 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Trouble building perfbook
Message-ID: <20151014005320.GS3910@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <561C9C0E.4090703@au1.ibm.com>
 <20151013133125.GM3910@linux.vnet.ibm.com> <561DA182.8000002@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561DA182.8000002@au1.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 14, 2015 at 11:27:46AM +1100, Andrew Donnellan wrote:
> On 14/10/15 00:31, Paul E. McKenney wrote:
> >This looks like the same LaTeX bug that Borislav Petkov ran into
> >some time back.  He came up with the workaround below, does this
> >work for you?
> 
> Appears to work - thanks!

Very good!

> >Just out of curiosity, what distro are you using?  I haven't run into
> >this myself on either Ubuntu 12.04 or 14.04.
> 
> Debian 8.2 without backports. As it turns out that shipped with
> TeXLive 2014.20141024. It appears the Debian bug you linked was
> fixed in 2015.20150625, which my home machine running Debian testing
> would have picked up by now, but I generally prefer more stable
> things for my IBM machine...

Well, at least a fix is in the works.  ;-)

							Thanx, Paul

