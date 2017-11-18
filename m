Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50712 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1162171AbdKRTTQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 18 Nov 2017 14:19:16 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAIJJ4KS021820
 for <perfbook@vger.kernel.org>; Sat, 18 Nov 2017 14:19:16 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2eahxatxv2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 18 Nov 2017 14:19:15 -0500
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 18 Nov
 2017 14:19:15 -0500
Date: Sat, 18 Nov 2017 11:19:13 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Julia language
Reply-To: paulmck@linux.vnet.ibm.com
References: <31ffe8fa-8787-7554-ce37-285cb0961a26@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31ffe8fa-8787-7554-ce37-285cb0961a26@gmail.com>
Message-Id: <20171118191913.GJ3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 17, 2017 at 12:43:19AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Have you heard of "Julia" language?
> 
> JFYI,
> As can be seen in its official page at https://julialang.org/ and a Wikipedia
> article at https://en.wikipedia.org/wiki/Julia_(programming_language),
> it looks like one of promising answers to perfbook's Section 2.2 "Parallel
> Programming Goals".
> 
> As long as high-performance number crunching is concerned, it claims to have
> comparable performance to C, with a programming productivity much better
> than C + MPI.
> 
> Note: I'm not a user of the language at the moment. I just heard of it at
> a twitter hashtag #julialang.
> 
> I'd like you to check it up and (hopefully) update the above mentioned
> section in perfbook.

I had heard of it, but I had not heard of it being seriously proposed
as the answer to Section 2.2.  I have added it to todo.txt with your
Reported-by.

Have you or has someone you know used this for a large parallel-programming
project?  (Just looking for some real-world confirmation.)

							Thanx, Paul

