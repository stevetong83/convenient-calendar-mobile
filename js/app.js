// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $(function() {
    var _ref, _ref1, _ref2;
    window.Contact = (function(_super) {
      __extends(Contact, _super);

      function Contact() {
        _ref = Contact.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return Contact;

    })(Backbone.Model);
    window.Contacts = (function(_super) {
      __extends(Contacts, _super);

      function Contacts() {
        _ref1 = Contacts.__super__.constructor.apply(this, arguments);
        return _ref1;
      }

      return Contacts;

    })(Backbone.Collection);
    return window.ContactsView = (function(_super) {
      __extends(ContactsView, _super);

      function ContactsView() {
        this.render = __bind(this.render, this);
        _ref2 = ContactsView.__super__.constructor.apply(this, arguments);
        return _ref2;
      }

      ContactsView.prototype.el = $('#container');

      ContactsView.prototype.initialize = function() {
        this.template = "<div id=\"contacts\">Contacts</div>";
        this.render();
        $(".icon").bind("touchstart", function() {
          return $('.icon').addClass('active');
        });
        return $(".icon").bind("touchend", function() {
          return $('.icon').removeClass('active');
        });
      };

      ContactsView.prototype.render = function() {
        $(this.el).html(this.template);
        $('#menu').html('Contacts');
        return $('#back').html("<button class='icon'>Menu</button");
      };

      return ContactsView;

    })(Backbone.View);
  });

  $(function() {
    var _ref, _ref1, _ref2;
    window.Event = (function(_super) {
      __extends(Event, _super);

      function Event() {
        _ref = Event.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return Event;

    })(Backbone.Model);
    window.Events = (function(_super) {
      __extends(Events, _super);

      function Events() {
        _ref1 = Events.__super__.constructor.apply(this, arguments);
        return _ref1;
      }

      return Events;

    })(Backbone.Collection);
    return window.EventsView = (function(_super) {
      __extends(EventsView, _super);

      function EventsView() {
        this.render = __bind(this.render, this);
        _ref2 = EventsView.__super__.constructor.apply(this, arguments);
        return _ref2;
      }

      EventsView.prototype.el = $('#page');

      EventsView.prototype.initialize = function() {
        this.template = "<div id=\"modal\">\n  <div id=\"modal-header\">\n    <div class=\"wrapper\">\n      <div id=\"modal-menu\">\n        New Event\n      </div>\n      <div id=\"modal-back\">\n        <button class='icon'>Cancel</button>\n      </div>\n      <div id=\"form\">\n        <form>\n          <input type=\"text\" name=\"event\" placeholder=\"Event\" />\n          <input type=\"text\" name=\"location\" placeholder=\"Location\"/>\n          <input type=\"date\" id=\"start-date\" placeholder=\"Start Date\" />\n          <input type=\"time\" id=\"start-time\" placeholder=\"Start Time\" pattern=\"^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$\" />\n          All Day: <input type=\"checkbox\" />\n          <textarea name=\"description\" placeholder=\"Description\" rows=\"5\"/>\n          <button class='cal-button wide-button'>Add Event</button>\n        </form>\n      </div>\n    </div>\n  </div>\n</div>\n<div id=\"cal-header\">\n  <div id=\"today\">\n    <button class=\"cal-button today\">Today</button>\n  </div>\n  <div id=\"new-event\">\n    <button class=\"new-event cal-button\">+</button>\n  </div>\n</div>\n<div id=\"calendar\"></div>\n<div id=\"cal-footer\">\n  <div id=\"previous\">\n    <button class=\"previous cal-button\"><</button>\n  </div>\n  <div id=\"center\">\n    <button class=\"month cal-button\">Month</button>\n    <button class=\"week cal-button\">Week</button>\n    <button class=\"day cal-button\">Day</button>\n  </div>\n  <div id=\"next\">\n    <button class=\"next cal-button\">></button>\n  </div>\n</div>";
        return this.render();
      };

      EventsView.prototype.events = function() {
        return {
          'tap .new-event': 'addNewEvent',
          'tap #modal-back > .icon': 'cancel',
          'tap .month': 'changeToMonthView',
          'tap .week': 'changeToWeekView',
          'tap .day': 'changeToDayView',
          'tap .today': 'today',
          'tap .previous': 'previous',
          'tap .next': 'next',
          'tap #start_date': 'openStartDate'
        };
      };

      EventsView.prototype.render = function() {
        $('#container').html(this.template);
        $('#back').html("<button class='icon'>Menu</button");
        $('#calendar').fullCalendar({
          viewDisplay: function(view) {
            return $('#menu').html(view.title);
          },
          header: false,
          aspectRatio: 1,
          defaultView: 'month',
          slotMinutes: 30,
          eventSource: "",
          loading: function(bool) {
            if (bool) {
              return $('#loading').show();
            } else {
              return $('#loading').hide();
            }
          },
          dayClick: function(date, allDay, jsEvent, view) {
            return alert(date);
          }
        });
        $(window).on("swipeleft", function(event) {
          return $('#calendar').fullCalendar('next');
        });
        $(window).on("swiperight", function(event) {
          return $('#calendar').fullCalendar('prev');
        });
        $(".today, .new-event, .previous, .next, .month, .week, .day").bind("touchstart", function() {
          return $(this).addClass('active');
        });
        $(".today, .new-event, .previous, .next, .month, .week, .day").bind("touchend", function() {
          return $(this).removeClass('active');
        });
        $(".icon").bind("touchstart", function() {
          return $('.icon').addClass('active');
        });
        return $(".icon").bind("touchend", function() {
          return $('.icon').removeClass('active');
        });
      };

      EventsView.prototype.addNewEvent = function() {
        return $('#modal').show();
      };

      EventsView.prototype.cancel = function(e) {
        e.preventDefault();
        return $('#modal').hide();
      };

      EventsView.prototype.changeToMonthView = function() {
        return $('#calendar').fullCalendar('changeView', 'month');
      };

      EventsView.prototype.changeToDayView = function() {
        return $('#calendar').fullCalendar('changeView', 'basicDay');
      };

      EventsView.prototype.changeToWeekView = function() {
        return $('#calendar').fullCalendar('changeView', 'basicWeek');
      };

      EventsView.prototype.today = function() {
        return $('#calendar').fullCalendar('today');
      };

      EventsView.prototype.previous = function() {
        return $('#calendar').fullCalendar('prev');
      };

      EventsView.prototype.next = function() {
        return $('#calendar').fullCalendar('next');
      };

      EventsView.prototype.openStartDate = function() {};

      return EventsView;

    })(Backbone.View);
  });

  $(function() {
    var _ref;
    return window.MenuView = (function(_super) {
      __extends(MenuView, _super);

      function MenuView() {
        this.render = __bind(this.render, this);
        _ref = MenuView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      MenuView.prototype.el = '#page';

      MenuView.prototype.initialize = function() {
        this.template = "<ul id=\"nav\">\n  <li id=\"events\"><img src=\"images/calendar.png\" />Calendar</li>\n  <li id=\"contacts\"><img src=\"images/contacts.png\" />Contacts</li>\n  <li id=\"photos\"><img src=\"images/photos.png\" />Photos</li>\n</ul>";
        return this.render();
      };

      MenuView.prototype.events = function() {
        return {
          "tap #events": "loadEvents",
          "tap #contacts": "loadContacts",
          "tap #photos": "loadPhotos",
          'tap #back > .icon': 'goToMenu'
        };
      };

      MenuView.prototype.render = function() {
        $('#container').html(this.template);
        $('#menu').html('Menu');
        $('#back').html('');
        $("#nav li").bind("touchstart", function() {
          return $(this).addClass('active');
        });
        return $("#nav li").bind("touchend", function() {
          return $(this).removeClass('active');
        });
      };

      MenuView.prototype.loadEvents = function() {
        return App.navigate('/events', {
          trigger: true
        });
      };

      MenuView.prototype.loadContacts = function() {
        return App.navigate('/contacts', {
          trigger: true
        });
      };

      MenuView.prototype.loadPhotos = function() {
        return App.navigate('/photos', {
          trigger: true
        });
      };

      MenuView.prototype.goToMenu = function() {
        return App.navigate('/menu', {
          trigger: true
        });
      };

      return MenuView;

    })(Backbone.View);
  });

  $(function() {
    var _ref, _ref1, _ref2;
    window.Photo = (function(_super) {
      __extends(Photo, _super);

      function Photo() {
        _ref = Photo.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return Photo;

    })(Backbone.Model);
    window.Photos = (function(_super) {
      __extends(Photos, _super);

      function Photos() {
        _ref1 = Photos.__super__.constructor.apply(this, arguments);
        return _ref1;
      }

      return Photos;

    })(Backbone.Collection);
    return window.PhotosView = (function(_super) {
      __extends(PhotosView, _super);

      function PhotosView() {
        this.render = __bind(this.render, this);
        _ref2 = PhotosView.__super__.constructor.apply(this, arguments);
        return _ref2;
      }

      PhotosView.prototype.el = $('#container');

      PhotosView.prototype.initialize = function() {
        this.template = "<div id=\"photos\">Photos</div>";
        this.render();
        $(".icon").bind("touchstart", function() {
          return $('.icon').addClass('active');
        });
        return $(".icon").bind("touchend", function() {
          return $('.icon').removeClass('active');
        });
      };

      PhotosView.prototype.render = function() {
        $(this.el).html(this.template);
        $('#menu').html('Photos');
        return $('#back').html("<button class='icon'>Menu</button");
      };

      return PhotosView;

    })(Backbone.View);
  });

  $(function() {
    var _ref, _ref1;
    window.Session = (function(_super) {
      __extends(Session, _super);

      function Session() {
        _ref = Session.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return Session;

    })(Backbone.Model);
    return window.SessionView = (function(_super) {
      __extends(SessionView, _super);

      function SessionView() {
        this.render = __bind(this.render, this);
        _ref1 = SessionView.__super__.constructor.apply(this, arguments);
        return _ref1;
      }

      SessionView.prototype.el = $('#container');

      SessionView.prototype.initialize = function() {
        this.template = "<p><input type=\"text\" name=\"email\" placeholder=\"Email\" /></p>\n<p><input type=\"text\" name=\"password\" placeholder=\"Password\" /></p>\n<p><button id=\"login\" class=\"cal-button wide-button\">Sign In</button></p>";
        this.render();
        $("#login").bind("touchstart", function() {
          return $('#login').addClass('active');
        });
        return $("#login").bind("touchend", function() {
          return $('#login').removeClass('active');
        });
      };

      SessionView.prototype.events = function() {
        return {
          "click #login": "loadMenu"
        };
      };

      SessionView.prototype.render = function() {
        return $(this.el).html(this.template);
      };

      SessionView.prototype.loadMenu = function() {
        return App.navigate('/menu', {
          trigger: true
        });
      };

      return SessionView;

    })(Backbone.View);
  });

  $(function() {
    var _ref;
    return window.BackboneAppRouter = (function(_super) {
      __extends(BackboneAppRouter, _super);

      function BackboneAppRouter() {
        _ref = BackboneAppRouter.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      BackboneAppRouter.prototype.routes = {
        "": "index",
        "menu": "menu",
        "events": "events",
        "contacts": "contacts",
        "photos": "photos"
      };

      BackboneAppRouter.prototype.index = function() {
        return window.sessionView = new SessionView;
      };

      BackboneAppRouter.prototype.menu = function() {
        return window.menuView = new MenuView;
      };

      BackboneAppRouter.prototype.events = function() {
        return window.eventsView = new EventsView;
      };

      BackboneAppRouter.prototype.contacts = function() {
        return window.contactsView = new ContactsView;
      };

      BackboneAppRouter.prototype.photos = function() {
        return window.photosView = new PhotosView;
      };

      window.App = new BackboneAppRouter();

      Backbone.history.start();

      return BackboneAppRouter;

    })(Backbone.Router);
  });

}).call(this);
