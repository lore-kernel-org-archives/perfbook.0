Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49904 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S966499AbeAOPuP (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 15
 Jan 2018 10:50:15 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w0FFo85b020089
 for <perfbook@vger.kernel.org>; Mon, 15 Jan 2018 10:50:15 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2fgxduagb1-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 15 Jan 2018 10:50:15 -0500
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 15 Jan
 2018 10:50:14 -0500
Date: Mon, 15 Jan 2018 07:50:17 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: STM implementation
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180115142809.GA28308@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180115142809.GA28308@HP>
Message-Id: <20180115155017.GI9671@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 15, 2018 at 10:28:33PM +0800, Yubin Ruan wrote:
> Hi Paul,
> 
> I writing to ask about implementation of STM (software transactional memory).
> 
> I just finish section 17 of the perfbook, but that doesn't say much about
> implementations of transactional memory, especially STM. Basically I
> understand the common implementation of HTM (hardware transactional memory)
> and have experience using it (thanks to the meltdown paper[1] and the original
> HTM paper[2] and some other materials[3]). But I cannot find useful materials
> on the topic of STM implementation. I read through the original STM paper[4],
> but found it a bit cryptographic (hard to understand). Based on the materials
> I read so far, STM can be implemented using lock-free algorithms or simply
> locking. Alternatively, it can also be implemented using techniques similar to
> those in the database world (write-ahead logging, i.e., journaling). But I
> guess a robust and efficient implementation will require more to handle issues
> such as I/O ? Can you provide some hints on this topic?
> 
> I am still investigating and will really appreciate any comments.

Hello, Yubin,

There has been a huge variety of STM implementations over the years.
Last I looked into it carefully (admittedly some years back), there was
a tradeoff between performance and scalability, but both performance
and scalability were quite poor compared to non-TM approaches.

A colleague of mine had good things to say about SwissTM, but that was
more than five years ago.  Michael Spear has done quite a bit of more
recent STM work, so looking at his publications would be helpful.

Please let me know how it goes!

							Thanx, Paul

>         Yubin
> 
> [1]: https://meltdownattack.com/meltdown.pdf
>     (The meltdown paper)
> 
> [2]: http://cs.brown.edu/~mph/HerlihyM93/herlihy93transactional.pdf
>     (Transactional Memory: Architectural Support for Lock-Free Data Structures)
> 
> [3]: https://www.scss.tcd.ie/~jones/CS4021/transactional%20memory.pdf
>     (A lecture note on Intel TSX, which also talk about implementation of HTM)
> 
> [4]: https://pdfs.semanticscholar.org/846e/87f6c8b9d8909d678b5c668cfe46cf40a348.pdf
>     (Software Transactional Memory)
> 

