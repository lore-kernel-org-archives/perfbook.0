Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:42009 "EHLO
 e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP
 id S1751449AbbJMFwr (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 13 Oct
 2015 01:52:47 -0400
Received: from /spool/local	by e23smtp06.au.ibm.com with IBM ESMTP SMTP
 Gateway: Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;	Tue, 13 Oct
 2015 15:52:45 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])	by
 d23dlp03.au.ibm.com (Postfix) with ESMTP id 61F13357804F	for
 <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 16:52:43 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])	by
 d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9D5qMkU57344180	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 16:52:31
 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])	by
 d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9D5qAZY003310	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 16:52:10
 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])	by
 d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9D5qA8K002841	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 16:52:10
 +1100
Received: from [10.61.2.248] (haven.au.ibm.com [9.192.254.114])	(using TLSv1.2
 with cipher DHE-RSA-AES128-SHA (128/128 bits))	(No client certificate
 requested)	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 570ADA01F9	for
 <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 16:51:46 +1100 (AEDT)
Message-ID: <561C9C0E.4090703@au1.ibm.com>
Date: Tue, 13 Oct 2015 16:52:14 +1100
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
MIME-Version: 1.0
Subject: Trouble building perfbook
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi perfbook list,

I'm having trouble building perfbook (latest git) - am encountering a 
weird fatal TeX error. I'm using the current TeXLive 2015 from Debian 
stable.

The TeX logfile is available at [0].

I've taken a look at the section of perfbook_flat.tex that it refers to, 
and I can't see anything particularly out of the ordinary. My LaTeX-fu 
isn't quite good enough to figure out what's going on here - any 
assistance would be appreciated!


Andrew


[0] http://pastebin.com/r4rMzF4d

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited

