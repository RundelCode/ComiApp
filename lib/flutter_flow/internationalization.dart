import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    '5to2xqve': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'ko2knbf9': {
      'es': 'Entregando Sabor a Tu Puerta',
      'en': 'Delivering Flavor to Your Door',
    },
    'hnu9ipmt': {
      'es': 'Comienza',
      'en': 'Starts',
    },
    'qqm27bij': {
      'es': 'Sobre Nosotros',
      'en': 'About us',
    },
    '5uxacyfo': {
      'es': 'Comencemos',
      'en': 'Let\'s start',
    },
  },
  // Home
  {
    '55wifsri': {
      'es': 'Negocios',
      'en': 'Business',
    },
    'n56q5cop': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'njcosxp2': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // buscar
  {
    'lj44eqg1': {
      'es': 'Buscar',
      'en': 'Look for',
    },
    '031atez5': {
      'es': '¿Que estas buscando?',
      'en': 'What are you looking for?',
    },
    'n787075x': {
      'es': 'Buscar',
      'en': 'Look for',
    },
  },
  // register
  {
    'mk6lybhz': {
      'es': 'Comir App',
      'en': 'Eat App',
    },
    'vpt541m1': {
      'es': 'Crear una cuenta',
      'en': 'Create an account',
    },
    'h8ewnab7': {
      'es': 'Llena la informacion que veras a continuación',
      'en': 'Fill out the information you will see below',
    },
    'mfg2cn94': {
      'es': 'Correo',
      'en': 'Mail',
    },
    'ru4a7ih1': {
      'es': 'Nombre',
      'en': 'Name',
    },
    '4svz8rqa': {
      'es': '',
      'en': '',
    },
    'j1690na9': {
      'es': 'Ciudad',
      'en': 'City',
    },
    'ys9nkx6a': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'dnpkg03j': {
      'es': 'Confirmar Contraseña',
      'en': 'Confirm Password',
    },
    'fqzb1mic': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'wpnmqf5j': {
      'es': 'Ya tienes una cuenta?',
      'en': 'Do you already have an account?',
    },
    '4pnh6n96': {
      'es': 'Inicia sesion aqui',
      'en': 'Log in here',
    },
    'ikgnjumb': {
      'es': 'O registrate con',
      'en': 'Or register with',
    },
    'k19t4qks': {
      'es': '',
      'en': 'Log in here',
    },
    'ybe7gfc0': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // login
  {
    '03v96k3a': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    '5g5nbd02': {
      'es': 'Bienvenido ',
      'en': 'Welcome',
    },
    'hslwyg8t': {
      'es': 'Llena los siguientes campos',
      'en': 'Fill out the following fields',
    },
    'ghf8gwuf': {
      'es': 'Correo',
      'en': 'Mail',
    },
    'ha78ze2p': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'b0a8qmo4': {
      'es': 'Inicia sesión',
      'en': 'Log in',
    },
    'n41bz2gi': {
      'es': 'No tienes una cuenta?',
      'en': 'You do not have an account?',
    },
    'l9hpvlf6': {
      'es': 'Registrate aqui',
      'en': 'Sign up here',
    },
    '6teb74p9': {
      'es': 'O inicia sesión con',
      'en': 'Or sign in with',
    },
    'khwbtj35': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // Mapa
  {
    'qxqrh10w': {
      'es': 'Mapa',
      'en': 'Map',
    },
    'irnt0aih': {
      'es': 'Mapa',
      'en': 'Map',
    },
  },
  // Perfil
  {
    'hz2bir58': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    't9qg9i37': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    '69ux2drq': {
      'es': 'Idioma',
      'en': 'Language',
    },
    'ne3s7c8v': {
      'es': 'Mis Negocios',
      'en': 'My business',
    },
    '0f3992yc': {
      'es': 'Cerrar Sesión',
      'en': 'Sign off',
    },
    'ncbxd2o6': {
      'es': 'Admin  (Solicitudes)',
      'en': 'Admin (Requests)',
    },
    'b09x7ny4': {
      'es': 'Admin  (Avisos)',
      'en': 'Admin (Notices)',
    },
    'qx9ilvee': {
      'es': 'Perfil',
      'en': 'Profile',
    },
  },
  // MisNegocios
  {
    '2p36wvjf': {
      'es': 'Mis Negocios',
      'en': 'My business',
    },
    'lpult92d': {
      'es': 'Crear Nuevo Negocio',
      'en': 'Create New Business',
    },
    'g7pw5e5z': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'ltmj9gu6': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // NuevoNegocio
  {
    'h3w2poty': {
      'es': 'Nuevo Negocio',
      'en': 'New business',
    },
    '435xb4rs': {
      'es': 'Llena la siguiente información',
      'en': 'Fill out the following information',
    },
    'tzhol1po': {
      'es': 'Nombre Del Negocio',
      'en': 'Business Name',
    },
    '9ig3q6mh': {
      'es': 'Descripción',
      'en': 'Description',
    },
    '67jcw3jq': {
      'es': 'Telefono',
      'en': 'Phone',
    },
    '2c9emt8a': {
      'es': 'Comida Rapida',
      'en': 'Fast food',
    },
    'm7h1zm4b': {
      'es': 'Postres',
      'en': 'Desserts',
    },
    'gh035ncm': {
      'es': 'Comida China',
      'en': 'Chinese Food',
    },
    'lz8uqq19': {
      'es': 'Comida Italiana',
      'en': 'Italian food',
    },
    'r57lyj7m': {
      'es': 'Comida De Mar',
      'en': 'Seafood',
    },
    'buydvg25': {
      'es': 'Comida Mexicana',
      'en': 'Mexican food',
    },
    'tnglmj1o': {
      'es': 'Otro',
      'en': 'Other',
    },
    'bdhtpsc7': {
      'es': 'Categorias',
      'en': 'Categories',
    },
    'hu0fvipv': {
      'es': 'Buscar...',
      'en': 'Look for...',
    },
    'mg54hayr': {
      'es': 'Restaurante',
      'en': 'Restaurant',
    },
    '00xwvqwe': {
      'es': 'Persona Natural',
      'en': 'Natural person',
    },
    'xsrd5dp7': {
      'es': 'Tipo De Negocio',
      'en': 'Business Type',
    },
    'ijf28fgn': {
      'es': 'Buscar...',
      'en': 'Look for...',
    },
    'w1fa74pq': {
      'es': 'Dirección',
      'en': 'Address',
    },
    '5b4i8j95': {
      'es': 'Crear Negocio',
      'en': 'Create Business',
    },
    'm54v79fs': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'dwcnlaps': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // Solicitudes
  {
    'uhpt5rpr': {
      'es': 'Solicitudes pendientes ',
      'en': 'Awaiting requests',
    },
    'o74x5wsm': {
      'es': 'Validar',
      'en': 'Validate',
    },
    'kep7vsak': {
      'es': 'Rechazar',
      'en': 'Decline',
    },
    'o9jjotm9': {
      'es': 'Comid APP',
      'en': 'Food APP',
    },
    'catbbtnz': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // MiNegocioIndividual
  {
    'hk51uocw': {
      'es': 'Validación Pendiente',
      'en': 'Validation Pending',
    },
    'v8s35l94': {
      'es': 'Validar',
      'en': 'Validate',
    },
    'qw0dpw27': {
      'es': 'Productos',
      'en': 'Products',
    },
    'el4jxf9q': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'f6jj8xos': {
      'es': 'Publicitar',
      'en': 'Advertise',
    },
    'ltknjeit': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'v85brjyx': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // SolicitudAValidar
  {
    'noxltdy9': {
      'es': 'Solicitud De Validación',
      'en': 'Validation Request',
    },
    '5o9qqpv0': {
      'es':
          '¡Aviso! Para que tu negocio sea validado es necesario subir una foto tuya con una gramera debido a que los precios dependeran de los pesos',
      'en':
          'Warning! For your business to be validated, it is necessary to upload a photo of yourself with a gramera because the prices will depend on the weights.',
    },
    'flacib7k': {
      'es': 'Cedula',
      'en': 'Identification card',
    },
    '09lnqfps': {
      'es': 'Foto De Validación',
      'en': 'Validation Photo',
    },
    'm5gjivzw': {
      'es': 'Nombre Del Propietario',
      'en': 'Owner Name',
    },
    'rzhxxjc8': {
      'es': 'Numero De Documento',
      'en': 'Document number',
    },
    'm2oun2ch': {
      'es': 'Enviar Solicitud',
      'en': 'Send request',
    },
    'mhp82zjm': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'v3gxvice': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // NuevoProducto
  {
    'eu6et9sv': {
      'es': 'Nuevo Producto',
      'en': 'New product',
    },
    '68qf03tl': {
      'es': 'Llena la siguiente información',
      'en': 'Fill out the following information',
    },
    'bw4osi71': {
      'es': 'Nombre Del Producto',
      'en': 'Product name',
    },
    '8vibrf5j': {
      'es': 'Precio',
      'en': 'Price',
    },
    'p9yj9mxa': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'lidihgsc': {
      'es': 'Crear Producto',
      'en': 'Create Product',
    },
    '78hlby6l': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'zrbpuj9i': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // NuevaPublicidad
  {
    '6ixmd5q7': {
      'es': 'Nuevo Aviso',
      'en': 'New notification',
    },
    'jyiu4b79': {
      'es': 'Llena la siguiente información',
      'en': 'Fill out the following information',
    },
    'ijr8ixhg': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'bxq7hmpq': {
      'es': 'Crear Aviso',
      'en': 'Create Notice',
    },
    '3mjhblw9': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    '79dxmbzy': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // SolicitudesDeAvisos
  {
    'c25k5w8e': {
      'es': 'Avisos',
      'en': 'Notices',
    },
    'xhgrdkhh': {
      'es': 'Activar',
      'en': 'Activate',
    },
    '05vxh42j': {
      'es': 'Desactivar',
      'en': 'Deactivate',
    },
    'vcn3o7kp': {
      'es': 'Comid APP',
      'en': 'Food APP',
    },
    '3zzfp5m4': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // negocioProductos
  {
    '2gm2w2lg': {
      'es': 'Chat',
      'en': 'Chat',
    },
    'a1t4f1f9': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'd7w5s5b2': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Chats
  {
    'iq2v52lu': {
      'es': 'Mis Chats',
      'en': 'My Chats',
    },
    '7ne49fgw': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'qbtd59ev': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MiNegocio
  {
    '1y13zmnz': {
      'es': 'Validación Pendiente',
      'en': 'Validation Pending',
    },
    '9mwxneh3': {
      'es': 'Validar',
      'en': 'Validate',
    },
    '857hzy7h': {
      'es': 'Ver Productos',
      'en': 'See products',
    },
    '0e3srmxm': {
      'es': 'Publicidad',
      'en': 'Advertising',
    },
    'm93ukyub': {
      'es': 'Agregar Producto',
      'en': 'Add Product',
    },
    'oidhckbt': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'npdos69m': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ProductosLista
  {
    'gih7ianu': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'cf4jahzy': {
      'es': '__',
      'en': '__',
    },
  },
  // Chat
  {
    '7vqudw63': {
      'es': 'Label here...',
      'en': 'Label here...',
    },
    '5eiyl0bd': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'dl6s1l4c': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // emptyProducts
  {
    '4ckfhk8s': {
      'es': 'No se encontraron productos...',
      'en': 'No products found...',
    },
  },
  // NegocioPopUp
  {
    'yhv2dzfm': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'wyltr6nv': {
      'es': 'Contáctanos',
      'en': 'Contact us',
    },
  },
  // Miscellaneous
  {
    'ax86h6r1': {
      'es': 'Por favor habilita tu ubicación',
      'en': '',
    },
    'x8xnivss': {
      'es': 'Por favor habilita tu cámara ',
      'en': '',
    },
    'xazx1tjs': {
      'es': 'Por favor habilita tu galeria ',
      'en': '',
    },
    'ox1fh6q6': {
      'es': 'Habilitar Notificaciones',
      'en': 'Enable Notifications',
    },
    'v64ybz3t': {
      'es': 'Por favor habilita tu cámara ',
      'en': '',
    },
    'qmwhfvln': {
      'es': 'Por favor habilita tus datos biometricos ',
      'en': '',
    },
    'ze1z5res': {
      'es': 'Por favor habilita tu calendario ',
      'en': '',
    },
    's23faarl': {
      'es': 'Por favor habilita el acceso a tus contactos ',
      'en': '',
    },
    'vlzrning': {
      'es': 'Por favor habilita tu microfono ',
      'en': '',
    },
    'dx5aq0bi': {
      'es': '',
      'en': '',
    },
    'xb41z3eg': {
      'es': '',
      'en': '',
    },
    '9kelnoth': {
      'es': '',
      'en': '',
    },
    'trim6woz': {
      'es': '',
      'en': '',
    },
    'gov0bktt': {
      'es': '',
      'en': '',
    },
    'skluguhk': {
      'es': '',
      'en': '',
    },
    'b0r03ftp': {
      'es': '',
      'en': '',
    },
    'a9trsuam': {
      'es': '',
      'en': '',
    },
    '6aa0730p': {
      'es': '',
      'en': '',
    },
    'yiza4thx': {
      'es': '',
      'en': '',
    },
    '819lhb96': {
      'es': '',
      'en': '',
    },
    'qhdkw49m': {
      'es': '',
      'en': '',
    },
    'y7bmhyht': {
      'es': '',
      'en': '',
    },
    'm2e4p08p': {
      'es': '',
      'en': '',
    },
    'svt75xl5': {
      'es': '',
      'en': '',
    },
    'nlcx8ilm': {
      'es': '',
      'en': '',
    },
    'fn31oeom': {
      'es': '',
      'en': '',
    },
    '8lltvi54': {
      'es': '',
      'en': '',
    },
    '4eyyvfjl': {
      'es': '',
      'en': '',
    },
    'gpfuot11': {
      'es': '',
      'en': '',
    },
    'gyg1pkb0': {
      'es': '',
      'en': '',
    },
    '5n4twx0g': {
      'es': '',
      'en': '',
    },
    'db48gblm': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
