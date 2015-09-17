Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx1.redhat.com ([209.132.183.28]:39638 "EHLO mx1.redhat.com"
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP	id S1753966AbbIQJc7
 (ORCPT <rfc822;perfbook@vger.kernel.org>);	Thu, 17 Sep 2015 05:32:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
 (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])	by mx1.redhat.com
 (Postfix) with ESMTPS id 01E402D2F11	for <perfbook@vger.kernel.org>; Thu, 17
 Sep 2015 09:32:58 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-79.ams2.redhat.com
 [10.36.112.79])	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4)
 with ESMTP id t8H9WvRl018100	for <perfbook@vger.kernel.org>; Thu, 17 Sep 2015
 05:32:58 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] Small improvements to qqz.sty
Date: Thu, 17 Sep 2015 11:32:54 +0200
Message-Id: <1442482376-16981-1-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

The first patch avoids cluttering the log with warnings.  The
second adds cross-links between quick quizzes and their answers.

Paolo Bonzini (2):
  qqz: avoid duplicate references
  qqz: cross-link questions and answers

 qqz.sty | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.5.0

